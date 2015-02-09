CREATE PROCEDURE [dbo].[Apu_Proyecto_Insumo_BySucursal]
(
   @p_Ver_Version_Id varchar (17),
   @p_Int_sucursal_id varchar (17),
   @p_Numero_Registros int,
   @p_Pagina_Actual int,
   @p_Codigo_Desde varchar(200),
   @p_Codigo_Hasta varchar(200),
   @p_Apu_Proyecto_Codigo varchar(200),
   @p_Apu_Proyecto_Nombre varchar(500),
   @p_Apu_Insumo_Nombre varchar(500),
   @p_Tipo varchar(3)

)
AS
	SET NOCOUNT ON;

if (@p_Codigo_Hasta is null)
begin

	SELECT @p_Codigo_Hasta=MAX(CONVERT(numeric, maximo))
	FROM (
	SELECT  MAX( Codigo) maximo
	FROM    Apu_Proyecto_Material
	UNION
	SELECT  MAX(Codigo) 
	FROM    Apu_Proyecto_Mano_Obra
	UNION
	SELECT MAX(Codigo) 
	FROM   Apu_Proyecto_Equipo
	 ) Apu_Proyecto_Mat_Man_Equ
end

if (@p_Codigo_Desde is null)
begin

	SELECT @p_Codigo_Desde=MIN(CONVERT(numeric, minimo))
	FROM (
	SELECT  MIN( Codigo) minimo
	FROM    Apu_Proyecto_Material
	WHERE   dbo._Apu_Proyecto_Int_Sucursal_Id (apu_proyecto_id ) = @p_Int_sucursal_id 
	UNION
	SELECT  MIN(Codigo) 
	FROM    Apu_Proyecto_Mano_Obra
	WHERE   dbo._Apu_Proyecto_Int_Sucursal_Id (apu_proyecto_id ) = @p_Int_sucursal_id 
	UNION
	SELECT MIN(Codigo) 
	FROM   Apu_Proyecto_Equipo
	WHERE  dbo._Apu_Proyecto_Int_Sucursal_Id (apu_proyecto_id ) = @p_Int_sucursal_id ) Apu_Proyecto_Mat_Man_Equ

end

	if (@p_Apu_Proyecto_Codigo is null)
		set @p_Apu_Proyecto_Codigo='%';
    if (@p_Apu_Proyecto_Nombre is null)
		set @p_Apu_Proyecto_Nombre='%'
    if (@p_Apu_Insumo_Nombre is null)
		set @p_Apu_Insumo_Nombre='%'
	if (@p_Tipo='%')
		set @p_Tipo=null


IF (@p_Tipo IS NULL)
  BEGIN
    SELECT 		Id,
				Codigo, 
				Apu_Proyecto_Id,
				Apu_Insumo_Id,
				Tipo,
				Tipo_Nombre,

				Apu_Proyecto_Codigo,
				Apu_Proyecto_Nombre,
				Apu_Proyecto_Etapa,

				Apu_Insumo_Codigo,
				Apu_Insumo_Nombre,

				Costo_Parametros,
				Costo_Proyecto,

				Int_Sucursal_Id
    FROM (
  	SELECT 		Id,
				Codigo, 
				Apu_Proyecto_Id,
				Apu_Insumo_Id,
				Tipo,
				Tipo_Nombre,

				Apu_Proyecto_Codigo,
				Apu_Proyecto_Nombre,
				Apu_Proyecto_Etapa,

				Apu_Insumo_Codigo,
				Apu_Insumo_Nombre,

				Costo_Parametros,
				Costo_Proyecto,

				Int_Sucursal_Id,
				ROW_NUMBER() OVER (ORDER BY Tipo) AS RowNumber 
	FROM (
			SELECT     
				Id,
				Codigo, 
				Apu_Proyecto_Id,
				Apu_Material_Id Apu_Insumo_Id,
				'MAT' Tipo,
				dbo.Dominio ('APU_PROYECTO_INSUMO', 'TIPO', 'MAT', @p_Ver_Version_Id ) Tipo_Nombre,

				dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) Apu_Proyecto_Codigo,
				dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id) Apu_Proyecto_Nombre,
				dbo._Apu_Proyecto_Etapa (Apu_Proyecto_Id) Apu_Proyecto_Etapa,

				dbo._Apu_Material_Codigo (Apu_Material_Id) Apu_Insumo_Codigo,
				dbo._Apu_Material_Nombre (Apu_Material_Id) Apu_Insumo_Nombre,

				dbo._Apu_Material_Costo_Total (Apu_Material_Id) Costo_Parametros,
				dbo._Apu_Proyecto_Material_Costo_Total (Id) Costo_Proyecto,

				dbo._Apu_Proyecto_Int_Sucursal_Id (apu_proyecto_Id) Int_Sucursal_Id
			    
			FROM         Apu_Proyecto_Material
			WHERE dbo._Apu_Proyecto_Int_Sucursal_Id (apu_proyecto_id ) = @p_Int_sucursal_id 
			AND ( convert(numeric,Codigo) between convert(numeric,@p_Codigo_Desde) and convert(numeric,@p_Codigo_Hasta))
			AND ( @p_Apu_Proyecto_Codigo ='%' OR dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) LIKE @p_Apu_Proyecto_Codigo)
			AND ( @p_Apu_Proyecto_Nombre ='%' OR dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id)LIKE @p_Apu_Proyecto_Nombre)
			AND ( @p_Apu_Insumo_Nombre ='%' OR dbo._Apu_Material_Nombre (Apu_Material_Id) LIKE @p_Apu_Insumo_Nombre)

			UNION
			SELECT     
				Id,
				Codigo, 
				Apu_Proyecto_Id,
				Apu_Material_Id Apu_Insumo_Id,
				'TRA' Tipo,
				dbo.Dominio ('APU_PROYECTO_INSUMO', 'TIPO', 'TRA', @p_Ver_Version_Id ) Tipo_Nombre,

				dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) Apu_Proyecto_Codigo,
				dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id) Apu_Proyecto_Nombre,
				dbo._Apu_Proyecto_Etapa (Apu_Proyecto_Id) Apu_Proyecto_Etapa,

				dbo._Apu_Material_Codigo (Apu_Material_Id) Apu_Insumo_Codigo,
				dbo._Apu_Material_Nombre (Apu_Material_Id) Apu_Insumo_Nombre,

				dbo._Apu_Transporte_Costo_Total (Apu_Material_Id) Costo_Parametros,
				dbo._Apu_Proyecto_Material_Costo_Transporte (Id) Costo_Proyecto,

				dbo._Apu_Proyecto_Int_Sucursal_Id (apu_proyecto_Id) Int_Sucursal_Id
			    
			FROM         Apu_Proyecto_Material
			WHERE dbo._Apu_Proyecto_Int_Sucursal_Id (apu_proyecto_id ) = @p_Int_sucursal_id 
			AND ( convert(numeric,Codigo) between convert(numeric,@p_Codigo_Desde) and convert(numeric,@p_Codigo_Hasta))
			AND ( @p_Apu_Proyecto_Codigo ='%' OR dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) LIKE @p_Apu_Proyecto_Codigo)
			AND ( @p_Apu_Proyecto_Nombre ='%' OR dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id)LIKE @p_Apu_Proyecto_Nombre)
			AND ( @p_Apu_Insumo_Nombre='%' OR dbo._Apu_Material_Nombre (Apu_Material_Id) LIKE @p_Apu_Insumo_Nombre)

			UNION
			SELECT     
				Id,
				Codigo, 
				Apu_Proyecto_Id,
				Apu_Mano_Obra_Id Apu_Insumo_Id,
				'MAN' Tipo,
				dbo.Dominio ('APU_PROYECTO_INSUMO', 'TIPO', 'MAN', @p_Ver_Version_Id ) Tipo_Nombre,

				dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) Apu_Proyecto_Codigo,
				dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id) Apu_Proyecto_Nombre,
				dbo._Apu_Proyecto_Etapa (Apu_Proyecto_Id) Apu_Proyecto_Etapa,
				dbo._Apu_Mano_Obra_Codigo (Apu_Mano_Obra_Id) Apu_Insumo_Codigo,
				dbo._Apu_Mano_Obra_Nombre (Apu_Mano_Obra_Id) Apu_Insumo_Nombre,

				dbo._Apu_Mano_Obra_Costo_Hora (Apu_Mano_Obra_Id) Costo_Parametros,
				dbo._Apu_Proyecto_Mano_Obra_Costo_Hora (Id) Costo_Proyecto,

				dbo._Apu_Proyecto_Int_Sucursal_Id (apu_proyecto_Id) Int_Sucursal_Id

			FROM         Apu_Proyecto_Mano_Obra
			WHERE dbo._Apu_Proyecto_Int_Sucursal_Id (apu_proyecto_id ) = @p_Int_sucursal_id 
			AND ( convert(numeric,Codigo) between convert(numeric,@p_Codigo_Desde) and convert(numeric,@p_Codigo_Hasta))
			AND ( @p_Apu_Proyecto_Codigo='%' OR dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) LIKE @p_Apu_Proyecto_Codigo)
			AND ( @p_Apu_Proyecto_Nombre='%' OR dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id)LIKE @p_Apu_Proyecto_Nombre)
			AND ( @p_Apu_Insumo_Nombre ='%' OR dbo._Apu_Mano_Obra_Nombre (Apu_Mano_Obra_Id) LIKE @p_Apu_Insumo_Nombre)

			UNION
			SELECT     
				Id,
				Codigo, 
				Apu_Proyecto_Id,
				Apu_Equipo_Id Apu_Insumo_Id,
				'EQU' Tipo,
				dbo.Dominio ('APU_PROYECTO_INSUMO', 'TIPO', 'EQU', @p_Ver_Version_Id ) Tipo_Nombre,

				dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) Apu_Proyecto_Codigo,
				dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id) Apu_Proyecto_Nombre,
				dbo._Apu_Proyecto_Etapa (Apu_Proyecto_Id) Apu_Proyecto_Etapa,
				dbo._Apu_Equipo_Codigo (Apu_Equipo_Id) Apu_Insumo_Codigo,
				dbo._Apu_Equipo_Nombre (Apu_Equipo_Id) Apu_Insumo_Nombre,

				dbo._Apu_Equipo_Costo_Hora   (Apu_Equipo_Id) Costo_Parametros,
				dbo._Apu_Proyecto_Equipo_Costo_Hora (Id) Costo_Proyecto,

				dbo._Apu_Proyecto_Int_Sucursal_Id (apu_proyecto_Id) Int_Sucursal_Id

			FROM         Apu_Proyecto_Equipo
			WHERE dbo._Apu_Proyecto_Int_Sucursal_Id (apu_proyecto_id ) = @p_Int_sucursal_id 
			AND ( convert(numeric,Codigo) between convert(numeric,@p_Codigo_Desde) and convert(numeric,@p_Codigo_Hasta))
			AND ( @p_Apu_Proyecto_Codigo ='%' OR dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) LIKE @p_Apu_Proyecto_Codigo)
			AND ( @p_Apu_Proyecto_Nombre='%' OR dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id)LIKE @p_Apu_Proyecto_Nombre)
			AND ( @p_Apu_Insumo_Nombre ='%' OR dbo._Apu_Equipo_Nombre (Apu_Equipo_Id) LIKE @p_Apu_Insumo_Nombre)

	  )Apu_Proyecto_Mat_Man_Equ_Aux
    ) Apu_Proyecto_Mat_Man_Equ
	WHERE  RowNumber > (@p_Numero_Registros* (@p_Pagina_Actual-1)) 
	and RowNumber <= (@p_Numero_Registros * (@p_Pagina_Actual))

END


IF (@p_Tipo ='MAT')
BEGIN

SELECT 		Id,
			Codigo, 
			Apu_Proyecto_Id,
			Apu_Insumo_Id,
			Tipo,
			Tipo_Nombre,

			Apu_Proyecto_Codigo,
			Apu_Proyecto_Nombre,
			Apu_Proyecto_Etapa,

			Apu_Insumo_Codigo,
			Apu_Insumo_Nombre,

			Costo_Parametros,
			Costo_Proyecto,

			Int_Sucursal_Id
	
	FROM (
			SELECT     
				Id,
				Codigo, 
				Apu_Proyecto_Id,
				Apu_Material_Id Apu_Insumo_Id,
				'MAT' Tipo,
				dbo.Dominio ('APU_PROYECTO_INSUMO', 'TIPO', 'MAT', @p_Ver_Version_Id ) Tipo_Nombre,

				dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) Apu_Proyecto_Codigo,
				dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id) Apu_Proyecto_Nombre,
				dbo._Apu_Proyecto_Etapa (Apu_Proyecto_Id) Apu_Proyecto_Etapa,

				dbo._Apu_Material_Codigo (Apu_Material_Id) Apu_Insumo_Codigo,
				dbo._Apu_Material_Nombre (Apu_Material_Id) Apu_Insumo_Nombre,

				dbo._Apu_Material_Costo_Total (Apu_Material_Id) Costo_Parametros,
				dbo._Apu_Proyecto_Material_Costo_Total (Id) Costo_Proyecto,

				dbo._Apu_Proyecto_Int_Sucursal_Id (apu_proyecto_Id) Int_Sucursal_Id,
		       ROW_NUMBER() OVER (ORDER BY Codigo) AS RowNumber 
			    
			FROM         Apu_Proyecto_Material
			WHERE dbo._Apu_Proyecto_Int_Sucursal_Id (apu_proyecto_id ) = @p_Int_sucursal_id 
			AND ( convert(numeric,Codigo) between convert(numeric,@p_Codigo_Desde) and convert(numeric,@p_Codigo_Hasta))
			AND ( @p_Apu_Proyecto_Codigo='%' OR dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) LIKE @p_Apu_Proyecto_Codigo)
			AND ( @p_Apu_Proyecto_Nombre='%' OR dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id)LIKE @p_Apu_Proyecto_Nombre)
			AND ( @p_Apu_Insumo_Nombre='%' OR dbo._Apu_Material_Nombre (Apu_Material_Id) LIKE @p_Apu_Insumo_Nombre)

    ) Apu_Proyecto_Material
	WHERE  RowNumber > (@p_Numero_Registros* (@p_Pagina_Actual-1)) 
	and RowNumber <= (@p_Numero_Registros * (@p_Pagina_Actual))
END

IF (@p_Tipo ='TRA')
BEGIN
	SELECT 	Id,
			Codigo, 
			Apu_Proyecto_Id,
			Apu_Insumo_Id,
			Tipo,
			Tipo_Nombre,

			Apu_Proyecto_Codigo,
			Apu_Proyecto_Nombre,
			Apu_Proyecto_Etapa,

			Apu_Insumo_Codigo,
			Apu_Insumo_Nombre,

			Costo_Parametros,
			Costo_Proyecto,

			Int_Sucursal_Id

	FROM (
		SELECT     
			Id,
			Codigo, 
			Apu_Proyecto_Id,
			Apu_Material_Id Apu_Insumo_Id,
			'TRA' Tipo,
			dbo.Dominio ('APU_PROYECTO_INSUMO', 'TIPO', 'TRA', @p_Ver_Version_Id ) Tipo_Nombre,

			dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) Apu_Proyecto_Codigo,
			dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id) Apu_Proyecto_Nombre,
			dbo._Apu_Proyecto_Etapa (Apu_Proyecto_Id) Apu_Proyecto_Etapa,

			dbo._Apu_Material_Codigo (Apu_Material_Id) Apu_Insumo_Codigo,
			dbo._Apu_Material_Nombre (Apu_Material_Id) Apu_Insumo_Nombre,

			dbo._Apu_Transporte_Costo_Total (Apu_Material_Id) Costo_Parametros,
			dbo._Apu_Proyecto_Material_Costo_Transporte (Id) Costo_Proyecto,

			dbo._Apu_Proyecto_Int_Sucursal_Id (apu_proyecto_Id) Int_Sucursal_Id,
			ROW_NUMBER() OVER (ORDER BY Codigo) AS RowNumber 
		    
		FROM         Apu_Proyecto_Material
		WHERE dbo._Apu_Proyecto_Int_Sucursal_Id (apu_proyecto_id ) = @p_Int_sucursal_id 
		AND ( convert(numeric,Codigo) between convert(numeric,@p_Codigo_Desde) and convert(numeric,@p_Codigo_Hasta))
		AND ( @p_Apu_Proyecto_Codigo='%'  OR dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) LIKE @p_Apu_Proyecto_Codigo)
		AND ( @p_Apu_Proyecto_Nombre='%' OR dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id)LIKE @p_Apu_Proyecto_Nombre)
		AND ( @p_Apu_Insumo_Nombre='%'  OR dbo._Apu_Material_Nombre (Apu_Material_Id) LIKE @p_Apu_Insumo_Nombre)
		)Apu_Proyecto_Material
	WHERE  RowNumber > (@p_Numero_Registros* (@p_Pagina_Actual-1)) 
	and RowNumber <= (@p_Numero_Registros * (@p_Pagina_Actual))

END

IF (@p_Tipo ='MAN')
BEGIN
SELECT 	Id,
			Codigo, 
			Apu_Proyecto_Id,
			Apu_Insumo_Id,
			Tipo,
			Tipo_Nombre,

			Apu_Proyecto_Codigo,
			Apu_Proyecto_Nombre,
			Apu_Proyecto_Etapa,

			Apu_Insumo_Codigo,
			Apu_Insumo_Nombre,

			Costo_Parametros,
			Costo_Proyecto,

			Int_Sucursal_Id

	FROM ( SELECT     
				Id,
				Codigo, 
				Apu_Proyecto_Id,
				Apu_Mano_Obra_Id Apu_Insumo_Id,
				'MAN' Tipo,
				dbo.Dominio ('APU_PROYECTO_INSUMO', 'TIPO', 'MAN', @p_Ver_Version_Id ) Tipo_Nombre,

				dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) Apu_Proyecto_Codigo,
				dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id) Apu_Proyecto_Nombre,
				dbo._Apu_Proyecto_Etapa (Apu_Proyecto_Id) Apu_Proyecto_Etapa,
				dbo._Apu_Mano_Obra_Codigo (Apu_Mano_Obra_Id) Apu_Insumo_Codigo,
				dbo._Apu_Mano_Obra_Nombre (Apu_Mano_Obra_Id) Apu_Insumo_Nombre,

				dbo._Apu_Mano_Obra_Costo_Hora (Apu_Mano_Obra_Id) Costo_Parametros,
				dbo._Apu_Proyecto_Mano_Obra_Costo_Hora (Id) Costo_Proyecto,

				dbo._Apu_Proyecto_Int_Sucursal_Id (apu_proyecto_Id) Int_Sucursal_Id,
				ROW_NUMBER() OVER (ORDER BY Codigo) AS RowNumber 

			FROM         Apu_Proyecto_Mano_Obra
			WHERE dbo._Apu_Proyecto_Int_Sucursal_Id (apu_proyecto_id ) = @p_Int_sucursal_id 
			AND ( convert(numeric,Codigo) between convert(numeric,@p_Codigo_Desde) and convert(numeric,@p_Codigo_Hasta))
			AND ( @p_Apu_Proyecto_Codigo='%' OR dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) LIKE @p_Apu_Proyecto_Codigo)
			AND ( @p_Apu_Proyecto_Nombre='%' OR dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id)LIKE @p_Apu_Proyecto_Nombre)
			AND ( @p_Apu_Insumo_Nombre='%' OR dbo._Apu_Mano_Obra_Nombre (Apu_Mano_Obra_Id) LIKE @p_Apu_Insumo_Nombre)

    )Apu_Proyecto_Mano_Obra
	WHERE  RowNumber > (@p_Numero_Registros* (@p_Pagina_Actual-1)) 
	and RowNumber <= (@p_Numero_Registros * (@p_Pagina_Actual))



END


IF (@p_Tipo ='EQU')
BEGIN
SELECT 	Id,
			Codigo, 
			Apu_Proyecto_Id,
			Apu_Insumo_Id,
			Tipo,
			Tipo_Nombre,

			Apu_Proyecto_Codigo,
			Apu_Proyecto_Nombre,
			Apu_Proyecto_Etapa,

			Apu_Insumo_Codigo,
			Apu_Insumo_Nombre,

			Costo_Parametros,
			Costo_Proyecto,

			Int_Sucursal_Id

	FROM (
			SELECT     
				Id,
				Codigo, 
				Apu_Proyecto_Id,
				Apu_Equipo_Id Apu_Insumo_Id,
				'EQU' Tipo,
				dbo.Dominio ('APU_PROYECTO_INSUMO', 'TIPO', 'EQU', @p_Ver_Version_Id ) Tipo_Nombre,

				dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) Apu_Proyecto_Codigo,
				dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id) Apu_Proyecto_Nombre,
				dbo._Apu_Proyecto_Etapa (Apu_Proyecto_Id) Apu_Proyecto_Etapa,
				dbo._Apu_Equipo_Codigo (Apu_Equipo_Id) Apu_Insumo_Codigo,
				dbo._Apu_Equipo_Nombre (Apu_Equipo_Id) Apu_Insumo_Nombre,

				dbo._Apu_Equipo_Costo_Hora   (Apu_Equipo_Id) Costo_Parametros,
				dbo._Apu_Proyecto_Equipo_Costo_Hora (Id) Costo_Proyecto,

				dbo._Apu_Proyecto_Int_Sucursal_Id (apu_proyecto_Id) Int_Sucursal_Id,
				ROW_NUMBER() OVER (ORDER BY Codigo) AS RowNumber 

			FROM         Apu_Proyecto_Equipo
			WHERE dbo._Apu_Proyecto_Int_Sucursal_Id (apu_proyecto_id ) = @p_Int_sucursal_id 
			AND ( convert(numeric,Codigo) between convert(numeric,@p_Codigo_Desde) and convert(numeric,@p_Codigo_Hasta))
			AND ( @p_Apu_Proyecto_Codigo='%'OR dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) LIKE @p_Apu_Proyecto_Codigo)
			AND ( @p_Apu_Proyecto_Nombre='%'OR dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id)LIKE @p_Apu_Proyecto_Nombre)
			AND ( @p_Apu_Insumo_Nombre='%' OR dbo._Apu_Equipo_Nombre (Apu_Equipo_Id) LIKE @p_Apu_Insumo_Nombre)

    )Apu_Proyecto_Equipo
	WHERE  RowNumber > (@p_Numero_Registros* (@p_Pagina_Actual-1)) 
	and RowNumber <= (@p_Numero_Registros * (@p_Pagina_Actual))

END