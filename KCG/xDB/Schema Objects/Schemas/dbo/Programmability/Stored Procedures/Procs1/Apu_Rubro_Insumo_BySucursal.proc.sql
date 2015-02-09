CREATE PROCEDURE [dbo].[Apu_Rubro_Insumo_BySucursal]
(
	--Parámetros de Filtrado Fijo
	@p_Ver_Version_Id VARCHAR(17),
	@p_Int_Sucursal_Id VARCHAR(17),	
	--Parámetros Opcionales
	@p_Apu_Rubro_Codigo_Desde VARCHAR(200),
	@p_Apu_Rubro_Codigo_Hasta VARCHAR(200),
	@p_Apu_Rubro_Nombre VARCHAR(500),	
	@p_Apu_Insumo_Nombre VARCHAR(500),
	@p_Tipo CHAR(3),
	@p_Apu_Subtitulo_Nombre VARCHAR(500),
	@p_Apu_Titulo_Nombre VARCHAR(500),
	--Parámetros de Paginación Fina
	@p_Numero_Registros INT,
	@p_Pagina_Actual INT
)
AS
	SET NOCOUNT ON;

if (@p_Tipo = '%') 
	BEGIN
		SELECT
			Id,
			Codigo, 
			Apu_Rubro_Id,
			Apu_Insumo_Id,
			Cantidad, 
			Fecha_Update,
			Update_Per_Personal_Id,
			Fecha_Creacion,
			Creacion_Per_Personal_Id,
			Estado,
			Tipo,
			dbo.Dominio ('APU_RUBRO_INSUMO', 'TIPO', Tipo, @p_Ver_Version_Id) Tipo_Nombre,
			replicate('N',1) Apu_Rubro_Codigo,
			dbo._Apu_Rubro_Nombre (Apu_Rubro_Id) Apu_Rubro_Nombre,
			replicate('N',1) Apu_Rubro_Unidad,
			replicate('N',1) Int_Sucursal_Id,
			Apu_Insumo_Codigo,
			Apu_Insumo_Nombre,
			replicate('N',1) Creacion_Per_Personal_Codigo,
			replicate('N',1) Creacion_Per_Personal_Nombre,		    
			replicate('N',1) Update_Per_Personal_Codigo,
			replicate('N',1) Update_Per_Personal_Nombre,		     
			costo,
			replicate('N',1) Apu_Subtitulo_id,
			replicate('N',1) Apu_Subtitulo_Codigo,
			replicate('N',1) Apu_Subtitulo_Nombre,
			replicate('N',1) Apu_Titulo_Id,
			replicate('N',1) Apu_Titulo_Codigo,
			replicate('N',1) Apu_Titulo_Nombre,
			0.0000 Costo_Indirecto,
			0.0000 Costo_Directo,
			0.0000 Costo_Total
		FROM 
			-- Union de todos los registros de insumos: MATERIAL, MANO DE OBRA, EQUIPOS 
			(SELECT   
				Id,
				Codigo, 
				Apu_Rubro_Id,
				Apu_Insumo_Id,
				Cantidad, 
				Fecha_Update,
				Update_Per_Personal_Id,
				Fecha_Creacion,
				Creacion_Per_Personal_Id,
				Estado,
				Tipo,
				--Tipo_Nombre,
				--Apu_Rubro_Codigo,
				--Apu_Rubro_Nombre,
				--Apu_Rubro_Unidad,
				--Int_Sucursal_Id,
				Apu_Insumo_Codigo,
				Apu_Insumo_Nombre,			  
				--Creacion_Per_Personal_Codigo,
				--Creacion_Per_Personal_Nombre,			    
				--Update_Per_Personal_Codigo,
				--Update_Per_Personal_Nombre,			     
				costo,
				--Apu_Subtitulo_id,
				--Apu_Subtitulo_Codigo,
				--Apu_Subtitulo_Nombre,
				--Apu_Titulo_Id,
				--Apu_Titulo_Codigo,
				--Apu_Titulo_Nombre,
				--Costo_Indirecto,
				--Costo_Directo,
				--Costo_Total,
				ROW_NUMBER() OVER (Order By Id) AS RowNumber 
				FROM (
					SELECT
						Id,
						Codigo, 
						Apu_Rubro_Id,
						Apu_Material_Id Apu_Insumo_Id,
						Cantidad, 
						Fecha_Update,
						Update_Per_Personal_Id,
						Fecha_Creacion,
						Creacion_Per_Personal_Id,
						Estado,
						'MAT' Tipo,
				--		dbo.dominio ('APU_RUBRO_INSUMO', 'TIPO', 'MAT', @p_Ver_Version_Id) Tipo_Nombre,
				--		null Apu_Rubro_Codigo,
				--		dbo._Apu_Rubro_Nombre (Apu_Rubro_Id) Apu_Rubro_Nombre,
				--		null Apu_Rubro_Unidad,
				--		null Int_Sucursal_Id,
						dbo._Apu_Material_Codigo (Apu_Material_Id) Apu_Insumo_Codigo,
						dbo._Apu_Material_Nombre (Apu_Material_Id) Apu_Insumo_Nombre,
				--		null Creacion_Per_Personal_Codigo,
				--		null Creacion_Per_Personal_Nombre,
				--		null Update_Per_Personal_Codigo,
				--		null Update_Per_Personal_Nombre,
						dbo._Apu_Rubro_Material_Costo_Total1 (id) costo
				--		null Apu_Subtitulo_id,
				--		null Apu_Subtitulo_Codigo,
				--		null Apu_Subtitulo_Nombre,
				--		null Apu_Titulo_Id,
				--		null Apu_Titulo_Codigo,
				--		null Apu_Titulo_Nombre
				--		0 Costo_Indirecto,
				--		0 Costo_Directo,
				--		0 Costo_Total
					FROM Apu_Rubro_Material
					WHERE (@p_Apu_Insumo_Nombre = '%' OR dbo._Apu_Material_Nombre (Apu_Material_Id) like @p_Apu_Insumo_Nombre)
				UNION
					SELECT
						Id,
						Codigo, 
						Apu_Rubro_Id,
						Apu_Mano_Obra_Id,
						Cantidad, 
						Fecha_Update,
						Update_Per_Personal_Id,
						Fecha_Creacion,
						Creacion_Per_Personal_Id,
						Estado,
						'MAN' Tipo,
				--		dbo.dominio ('APU_RUBRO_INSUMO', 'TIPO', 'MAN', @p_Ver_Version_Id) Tipo_Nombre,
				--		null Apu_Rubro_Codigo,
				--		dbo._Apu_Rubro_Nombre (Apu_Rubro_Id) Apu_Rubro_Nombre,
				--		null Apu_Rubro_Unidad,
				--		null Int_Sucursal_Id,
						dbo._Apu_Mano_Obra_Codigo (Apu_Mano_Obra_Id) Apu_Insumo_Codigo,
						dbo._Apu_Mano_Obra_Nombre (Apu_Mano_Obra_Id) Apu_Insumo_Nombre,				
				--		null Creacion_Per_Personal_Codigo,
				--		null Creacion_Per_Personal_Nombre,
				--		null Update_Per_Personal_Codigo,
				--		null Update_Per_Personal_Nombre,
						dbo._Apu_Rubro_Mano_Obra_Costo_X_Rendimiento (id) costo
				--		null Apu_Subtitulo_id,
				--		null Apu_Subtitulo_Codigo,
				--		null Apu_Subtitulo_Nombre,
				--		null Apu_Titulo_Id,
				--		null Apu_Titulo_Codigo,
				--		null Apu_Titulo_Nombre
				--		0 Costo_Indirecto,
				--		0 Costo_Directo,
				--		0 Costo_Total
					FROM Apu_Rubro_Mano_Obra
					WHERE (@p_Apu_Insumo_Nombre = '%' OR dbo._Apu_Mano_Obra_Nombre (Apu_Mano_Obra_Id) like @p_Apu_Insumo_Nombre)
				UNION
					SELECT
						Id,
						Codigo, 
						Apu_Rubro_Id,
						Apu_Equipo_Id Apu_Insumo_Id,
						Cantidad, 
						Fecha_Update,
						Update_Per_Personal_Id,
						Fecha_Creacion,
						Creacion_Per_Personal_Id,
						Estado,
						'EQU' Tipo,
				--		dbo.dominio ('APU_RUBRO_INSUMO', 'TIPO', 'EQU', @p_Ver_Version_Id) Tipo_Nombre,
				--		null Apu_Rubro_Codigo,
				--		dbo._Apu_Rubro_Nombre (Apu_Rubro_Id) Apu_Rubro_Nombre,
				--		null Apu_Rubro_Unidad,
				--		null Int_Sucursal_Id,
						dbo._Apu_Equipo_Codigo (Apu_Equipo_Id) Apu_Insumo_Codigo,
						dbo._Apu_Equipo_Nombre (Apu_Equipo_Id) Apu_Insumo_Nombre,
				--		null Creacion_Per_Personal_Codigo,
				--		null Creacion_Per_Personal_Nombre,
				--		null Update_Per_Personal_Codigo,
				--		null Update_Per_Personal_Nombre,
						dbo._Apu_Rubro_Equipo_Costo_X_Rendimiento (id) costo
				--		null Apu_Subtitulo_id,
				--		null Apu_Subtitulo_Codigo,
				--		null Apu_Subtitulo_Nombre,
				--		null Apu_Titulo_Id,
				--		null Apu_Titulo_Codigo,
				--		null Apu_Titulo_Nombre
				--		0 Costo_Indirecto,
				--		0 Costo_Directo,
				--		0 Costo_Total
					FROM  Apu_Rubro_Equipo
					WHERE (@p_Apu_Insumo_Nombre = '%' OR dbo._Apu_Equipo_Nombre (Apu_Equipo_Id) like @p_Apu_Insumo_Nombre)
				)Apu_Rubro_Material_Mano_Equipo_Aux 
				WHERE dbo._Apu_Rubro_Codigo(Apu_Rubro_Id) 
						BETWEEN convert(numeric,@p_Apu_Rubro_Codigo_Desde) AND convert(numeric,@p_Apu_Rubro_Codigo_Hasta)
				AND dbo._Apu_Rubro_Nombre(Apu_Rubro_Id) like @p_Apu_Rubro_Nombre
				AND dbo._Apu_Subtitulo_Nombre(dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id)) like @p_Apu_Subtitulo_Nombre
				AND dbo._Apu_Titulo_Nombre(dbo._Apu_Subtitulo_Apu_Titulo_Id(dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id))) like @p_Apu_Titulo_Nombre

        ) Apu_Rubro_Material_Mano_Equipo
		WHERE  RowNumber > (@p_Numero_Registros* (@p_Pagina_Actual-1)) 
		and RowNumber <= (@p_Numero_Registros * (@p_Pagina_Actual))
END


IF (@p_Tipo ='MAT' ) 
BEGIN	
	SELECT   
		Id,
		Codigo, 
		Apu_Rubro_Id,
		Apu_Insumo_Id,
		Cantidad, 
		Fecha_Update,
		Update_Per_Personal_Id,
		Fecha_Creacion,
		Creacion_Per_Personal_Id,
		Estado,
		Tipo,
		Tipo_Nombre,
		Apu_Rubro_Codigo,
		Apu_Rubro_Nombre,
		Apu_Rubro_Unidad,
		Int_Sucursal_Id,
		Apu_Insumo_Codigo,
		Apu_Insumo_Nombre,		  
		Creacion_Per_Personal_Codigo,
		Creacion_Per_Personal_Nombre,		    
		Update_Per_Personal_Codigo,
		Update_Per_Personal_Nombre,		     
		costo,
		Apu_Subtitulo_id,
		Apu_Subtitulo_Codigo,
		Apu_Subtitulo_Nombre,
		Apu_Titulo_Id,
		Apu_Titulo_Codigo,
		Apu_Titulo_Nombre,
		Costo_Indirecto,
		Costo_Directo,
		Costo_Total
	FROM (

		SELECT     
			Id,
			Codigo, 
			Apu_Rubro_Id,
			Apu_Material_Id Apu_Insumo_Id,
			Cantidad, 
			Fecha_Update,
			Update_Per_Personal_Id,
			Fecha_Creacion,
			Creacion_Per_Personal_Id,
			Estado,
			'MAT' Tipo,
			dbo.Dominio ('APU_RUBRO_INSUMO', 'TIPO', 'MAT', @p_Ver_Version_Id) Tipo_Nombre,

			null Apu_Rubro_Codigo,
			dbo._Apu_Rubro_Nombre (Apu_Rubro_Id) Apu_Rubro_Nombre,
			null Apu_Rubro_Unidad,
			null Int_Sucursal_Id,

			dbo._Apu_Material_Codigo (Apu_Material_Id) Apu_Insumo_Codigo,
			dbo._Apu_Material_Nombre (Apu_Material_Id) Apu_Insumo_Nombre,

			null Creacion_Per_Personal_Codigo,
			null Creacion_Per_Personal_Nombre,
		    
			null Update_Per_Personal_Codigo,
			null Update_Per_Personal_Nombre,

			dbo._Apu_Rubro_Material_Costo_Total1 (id) costo,

			null Apu_Subtitulo_id,
			null Apu_Subtitulo_Codigo,
			null Apu_Subtitulo_Nombre,

			null Apu_Titulo_Id,
			null Apu_Titulo_Codigo,
			null Apu_Titulo_Nombre,

			0 Costo_Indirecto,
			0 Costo_Directo,
			0 Costo_Total,
			ROW_NUMBER() OVER (ORDER BY Id) AS RowNumber 

		FROM Apu_Rubro_Material
		WHERE (@p_Apu_Insumo_Nombre = '%' OR dbo._Apu_Material_Nombre (Apu_Material_Id) like @p_Apu_Insumo_Nombre)
		AND dbo._Apu_Rubro_Codigo(Apu_Rubro_Id) 
			BETWEEN convert(numeric,@p_Apu_Rubro_Codigo_Desde) AND convert(numeric,@p_Apu_Rubro_Codigo_Hasta)
		AND dbo._Apu_Rubro_Nombre(Apu_Rubro_Id) like @p_Apu_Rubro_Nombre
		AND dbo._Apu_Subtitulo_Nombre(dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id)) like @p_Apu_Subtitulo_Nombre
		AND dbo._Apu_Titulo_Nombre(dbo._Apu_Subtitulo_Apu_Titulo_Id(dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id))) like @p_Apu_Titulo_Nombre
    ) Apu_Rubro_Material

	WHERE  RowNumber > (@p_Numero_Registros* (@p_Pagina_Actual-1)) 
	and RowNumber <= (@p_Numero_Registros * (@p_Pagina_Actual))
END

IF (@p_Tipo ='MAN' ) 
BEGIN
	SELECT   
		Id,
		Codigo, 
		Apu_Rubro_Id,
		Apu_Insumo_Id,
		Cantidad, 
		Fecha_Update,
		Update_Per_Personal_Id,
		Fecha_Creacion,
		Creacion_Per_Personal_Id,
		Estado,
		Tipo,
		Tipo_Nombre,
		Apu_Rubro_Codigo,
		Apu_Rubro_Nombre,
		Apu_Rubro_Unidad,
		Int_Sucursal_Id,
		Apu_Insumo_Codigo,
		Apu_Insumo_Nombre,		  
		Creacion_Per_Personal_Codigo,
		Creacion_Per_Personal_Nombre,		    
		Update_Per_Personal_Codigo,
		Update_Per_Personal_Nombre,		     
		costo,
		Apu_Subtitulo_id,
		Apu_Subtitulo_Codigo,
		Apu_Subtitulo_Nombre,
		Apu_Titulo_Id,
		Apu_Titulo_Codigo,
		Apu_Titulo_Nombre,
		Costo_Indirecto,
		Costo_Directo,
		Costo_Total
	FROM (

		SELECT     
			Id,
			Codigo, 
			Apu_Rubro_Id,
			Apu_Mano_Obra_Id Apu_Insumo_Id,
			Cantidad, 
			Fecha_Update,
			Update_Per_Personal_Id,
			Fecha_Creacion,
			Creacion_Per_Personal_Id,
			Estado,
			'MAN' Tipo,
			dbo.Dominio ('APU_RUBRO_INSUMO', 'TIPO', 'MAN', @p_Ver_Version_Id) Tipo_Nombre,

			null Apu_Rubro_Codigo,
			dbo._Apu_Rubro_Nombre (Apu_Rubro_Id) Apu_Rubro_Nombre,
			null Apu_Rubro_Unidad,
			null Int_Sucursal_Id,

			null Apu_Insumo_Codigo,
			null Apu_Insumo_Nombre,

			null Creacion_Per_Personal_Codigo,
			null Creacion_Per_Personal_Nombre,
		    
			null Update_Per_Personal_Codigo,
			null Update_Per_Personal_Nombre,

			dbo._Apu_Rubro_Mano_Obra_Costo_X_Rendimiento (id) costo,

			null Apu_Subtitulo_id,
			null Apu_Subtitulo_Codigo,
			null Apu_Subtitulo_Nombre,

			null Apu_Titulo_Id,
			null Apu_Titulo_Codigo,
			null Apu_Titulo_Nombre,

			0 Costo_Indirecto,
			0 Costo_Directo,
			0 Costo_Total,	
            ROW_NUMBER() OVER (ORDER BY Id) AS RowNumber 

		FROM Apu_Rubro_Mano_Obra
		WHERE (@p_Apu_Insumo_Nombre = '%' )
		AND dbo._Apu_Rubro_Codigo(Apu_Rubro_Id) 
			BETWEEN convert(numeric,@p_Apu_Rubro_Codigo_Desde) AND convert(numeric,@p_Apu_Rubro_Codigo_Hasta)
		AND dbo._Apu_Rubro_Nombre(Apu_Rubro_Id) like @p_Apu_Rubro_Nombre
		AND dbo._Apu_Subtitulo_Nombre(dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id)) like @p_Apu_Subtitulo_Nombre
		AND dbo._Apu_Titulo_Nombre(dbo._Apu_Subtitulo_Apu_Titulo_Id(dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id))) like @p_Apu_Titulo_Nombre
    ) Apu_Rubro_Mano_Obra
	WHERE  RowNumber > (@p_Numero_Registros* (@p_Pagina_Actual-1)) 
	and RowNumber <= (@p_Numero_Registros * (@p_Pagina_Actual))
END

IF (@p_Tipo ='EQU') 
BEGIN
	SELECT   
		Id,
		Codigo, 
		Apu_Rubro_Id,
		Apu_Insumo_Id,
		Cantidad, 
		Fecha_Update,
		Update_Per_Personal_Id,
		Fecha_Creacion,
		Creacion_Per_Personal_Id,
		Estado,
		Tipo,
		Tipo_Nombre,
		Apu_Rubro_Codigo,
		Apu_Rubro_Nombre,
		Apu_Rubro_Unidad,
		Int_Sucursal_Id,
		Apu_Insumo_Codigo,
		Apu_Insumo_Nombre,		  
		Creacion_Per_Personal_Codigo,
		Creacion_Per_Personal_Nombre,		    
		Update_Per_Personal_Codigo,
		Update_Per_Personal_Nombre,		     
		costo,
		Apu_Subtitulo_id,
		Apu_Subtitulo_Codigo,
		Apu_Subtitulo_Nombre,
		Apu_Titulo_Id,
		Apu_Titulo_Codigo,
		Apu_Titulo_Nombre,
		Costo_Indirecto,
		Costo_Directo,
		Costo_Total	
	FROM (

		SELECT     
			Id,
			Codigo, 
			Apu_Rubro_Id,
			Apu_Equipo_Id Apu_Insumo_Id,
			Cantidad, 
			Fecha_Update,
			Update_Per_Personal_Id,
			Fecha_Creacion,
			Creacion_Per_Personal_Id,
			Estado,
			'EQU' Tipo,
			dbo.Dominio ('APU_RUBRO_INSUMO', 'TIPO', 'EQU', @p_Ver_Version_Id) Tipo_Nombre,

			null Apu_Rubro_Codigo,
			dbo._Apu_Rubro_Nombre (Apu_Rubro_Id) Apu_Rubro_Nombre,
			null Apu_Rubro_Unidad,
			null Int_Sucursal_Id,

			dbo._Apu_Equipo_Codigo (Apu_Equipo_Id) Apu_Insumo_Codigo,
			dbo._Apu_Equipo_Nombre (Apu_Equipo_Id) Apu_Insumo_Nombre,

			null Creacion_Per_Personal_Codigo,
			null Creacion_Per_Personal_Nombre,
		    
			null Update_Per_Personal_Codigo,
			null Update_Per_Personal_Nombre,

			dbo._Apu_Rubro_Equipo_Costo_X_Rendimiento (id) costo,

			null Apu_Subtitulo_id,
			null Apu_Subtitulo_Codigo,
			null Apu_Subtitulo_Nombre,

			null Apu_Titulo_Id,
			null Apu_Titulo_Codigo,
			null Apu_Titulo_Nombre,

			0 Costo_Indirecto,
			0 Costo_Directo,
			0 Costo_Total,
			ROW_NUMBER() OVER (ORDER BY Id) AS RowNumber 

		FROM Apu_Rubro_Equipo
		WHERE (@p_Apu_Insumo_Nombre = '%' OR dbo._Apu_Equipo_Nombre (Apu_Equipo_Id) like @p_Apu_Insumo_Nombre)
		AND dbo._Apu_Rubro_Codigo(Apu_Rubro_Id) 
			BETWEEN convert(numeric,@p_Apu_Rubro_Codigo_Desde) AND convert(numeric,@p_Apu_Rubro_Codigo_Hasta)
		AND dbo._Apu_Rubro_Nombre(Apu_Rubro_Id) like @p_Apu_Rubro_Nombre
		AND dbo._Apu_Subtitulo_Nombre(dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id)) like @p_Apu_Subtitulo_Nombre
		AND dbo._Apu_Titulo_Nombre(dbo._Apu_Subtitulo_Apu_Titulo_Id(dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id))) like @p_Apu_Titulo_Nombre
		) Apu_Rubro_Equipo 
	WHERE  RowNumber > (@p_Numero_Registros* (@p_Pagina_Actual-1)) 
	and RowNumber <= (@p_Numero_Registros * (@p_Pagina_Actual))
END