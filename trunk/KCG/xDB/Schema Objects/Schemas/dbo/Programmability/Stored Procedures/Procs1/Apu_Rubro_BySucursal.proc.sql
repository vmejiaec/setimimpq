CREATE PROCEDURE dbo.Apu_Rubro_BySucursal
(
	--Parámetros de Filtrado Fijo
	@p_Ver_Version_Id VARCHAR(17),
	@p_Int_Sucursal_Id VARCHAR(17),
	--Parámetros de Filtrado Opcional
	@p_Codigo_Desde VARCHAR(200),
	@p_Codigo_Hasta VARCHAR(200),
	@p_Nombre VARCHAR(500),
	@p_Apu_Subtitulo_Codigo_Desde VARCHAR(200),
	@p_Apu_Subtitulo_Codigo_Hasta VARCHAR(200),
	@p_Apu_Subtitulo_Nombre VARCHAR(500),
	@p_Apu_Titulo_Codigo_Desde VARCHAR(200),
	@p_Apu_Titulo_Codigo_Hasta VARCHAR(200),
	@p_Apu_Titulo_Nombre VARCHAR(500),
	--Parámetros de Paginación
	@p_Numero_Registros INT,
	@p_Pagina_Actual INT
)
AS
	SET NOCOUNT ON;

SELECT 
  -- Campos propios
	Id,
	Codigo,
	Nombre,
	Unidad, 
	Int_Sucursal_Id, 
	Apu_Subtitulo_id,
	Int_Moneda_Id,
	Rendimiento_Mano_Obra,
	Rendimiento_Equipo,
	Especial,
	Disponible,
	Descripcion,   
	Fecha_Creacion,
	Creacion_Per_Personal_Id,
	Fecha_Update,
	Update_Per_Personal_Id,
	Estado,
	-- Empresa y Sucursal
		dbo._Int_Sucursal_Codigo (Int_Sucursal_Id) Int_Sucursal_Codigo,
		dbo._Int_Sucursal_Nombre (Int_Sucursal_Id) Int_Sucursal_Nombre, --
		dbo._Int_Sucursal_Int_Empresa_Id (Int_Sucursal_Id) Int_Empresa_Id,      --
		dbo._Int_Empresa_Codigo (dbo._Int_Sucursal_Int_Empresa_Id (Int_Sucursal_Id)) Int_Empresa_Codigo,  --
		dbo._Int_Empresa_Nombre (dbo._Int_Sucursal_Int_Empresa_Id (Int_Sucursal_Id)) Int_Empresa_Nombre,  --
    
	-- Titulo, Subtitulo y Personas
		dbo._Apu_Subtitulo_Codigo (Apu_Subtitulo_Id) Apu_Subtitulo_Codigo, --
		dbo._Apu_Subtitulo_Nombre (Apu_Subtitulo_Id) Apu_Subtitulo_Nombre, --
		dbo._Apu_Subtitulo_Apu_Titulo_Id (Apu_Subtitulo_Id) Apu_Titulo_id,     --
		dbo._Apu_Titulo_Codigo (dbo._Apu_Subtitulo_Apu_Titulo_Id (Apu_Subtitulo_Id)) Apu_Titulo_Codigo,
		dbo._Apu_Titulo_Nombre (dbo._Apu_Subtitulo_Apu_Titulo_Id (Apu_Subtitulo_Id)) Apu_Titulo_Nombre,  --

	-- Moneda
	    dbo._Int_Moneda_Codigo (Int_Moneda_Id) Int_Moneda_Codigo,
        dbo._Int_Moneda_Nombre (int_Moneda_Id) Int_Moneda_Nombre,
        dbo._Int_Moneda_Simbolo (int_Moneda_Id) Int_Moneda_Simbolo,

	    dbo._Per_Personal_Codigo (Creacion_Per_Personal_Id) Creacion_Per_Personal_Codigo,
        dbo._Per_Personal_Nombre (Creacion_Per_Personal_Id) Creacion_Per_Personal_Nombre,
        dbo._Per_Personal_Codigo (Update_Per_Personal_Id) Update_Per_Personal_Codigo,
        dbo._Per_Personal_Nombre (Update_Per_Personal_Id) Update_Per_Personal_Nombre,

	-- Rendimientos
	    dbo._Apu_Rubro_Rendimiento_Mano_Obra_Hora_R (Rendimiento_Mano_Obra) Rendimiento_Mano_Obra_Hora,
        dbo._Apu_Rubro_Rendimiento_Equipo_Hora_R (Rendimiento_Equipo) Rendimiento_Equipo_Hora,

	-- Costo directo
		dbo._Apu_Rubro_Material_Costo_Total(id) Apu_rubro_material_costo_total,   --
		dbo._Apu_Rubro_Transporte_Costo_Total(id)Apu_rubro_transporte_costo_total,

	-- Costo material + transporte
		dbo.__Suma_Cuatro_Decimales_2 (
			dbo._Apu_Rubro_Material_Costo_Total(id),
			dbo._Apu_Rubro_Transporte_Costo_Total(id))
			Apu_rubro_material_transporte_costo_total, --

		dbo._Apu_Rubro_Mano_Obra_Costo_Total_Rendimiento(id) Apu_rubro_mano_obra_costo_total,  --
		dbo._Apu_Rubro_Equipo_Costo_Total_Rendimiento(id) Apu_rubro_equipo_costo_total,     --


	-- Fechas últimas de modificacion
	    GetDate() Apu_rubro_material_ultima_fecha_update,
		GetDate() Apu_rubro_transporte_ultima_fecha_update,
		GetDate() Apu_rubro_mano_obra_ultima_fecha_update,
		GetDate() Apu_rubro_equipo_ultima_fecha_update,

	-- Costo directo, indirecto y total
		dbo.__Suma_Cuatro_Decimales_4(
			dbo._Apu_Rubro_Material_Costo_Total(id),
			dbo._Apu_Rubro_Mano_Obra_Costo_Total_Rendimiento(id),
			dbo._Apu_Rubro_Equipo_Costo_Total_Rendimiento(id),
			dbo._Apu_Rubro_Transporte_Costo_Total(id))
			Costo_Directo, 
	-- --------------------------------------- Costo Directo 
		dbo.__Porcentaje_Cuatro_Decimales(
			dbo.__Suma_Cuatro_Decimales_4(
					dbo._Apu_Rubro_Material_Costo_Total(id),
					dbo._Apu_Rubro_Mano_Obra_Costo_Total_Rendimiento(id),
					dbo._Apu_Rubro_Equipo_Costo_Total_Rendimiento(id),
					dbo._Apu_Rubro_Transporte_Costo_Total(id)),
			dbo._Apu_Parametros_Porcentaje_Costo_Indirecto(int_sucursal_id) )
		Costo_Indirecto, 
	-- ------------------------------------- Costo Indirecto 
		dbo.__Suma_Dos_Decimales_2(
		 dbo.__Suma_Cuatro_Decimales_4(
			 dbo._Apu_Rubro_Material_Costo_Total(id),
			 dbo._Apu_Rubro_Mano_Obra_Costo_Total_Rendimiento(id),
			dbo._Apu_Rubro_Equipo_Costo_Total_Rendimiento(id) ,
			  dbo._Apu_Rubro_Transporte_Costo_Total(id))
		,  
		 dbo.__Porcentaje_Cuatro_Decimales(
			dbo.__Suma_Cuatro_Decimales_4(
					dbo._Apu_Rubro_Material_Costo_Total(id),
					dbo._Apu_Rubro_Mano_Obra_Costo_Total_Rendimiento(id),
					dbo._Apu_Rubro_Equipo_Costo_Total_Rendimiento(id),
					dbo._Apu_Rubro_Transporte_Costo_Total(id)),
			dbo._Apu_Parametros_Porcentaje_Costo_Indirecto(int_sucursal_id) )
		)		
		Costo_Total, -- ----------------------------------------- Costo Total 

	-- Porcentaje Costo indirecto
		dbo._Apu_Parametros_Porcentaje_Costo_Indirecto(int_sucursal_id) Porcentaje_costo_indirecto , --

	-- Dominios y estado
		dbo.Dominio('APU_RUBRO', 'DISPONIBLE', Disponible, @p_Ver_Version_Id) Disponible_Nombre, 
		dbo.Dominio('APU_RUBRO', 'ESPECIAL', Especial, @p_Ver_Version_Id) Especial_Nombre,   
		dbo.Estado ('APU_RUBRO', 'ESTADO', Estado, @p_Ver_Version_Id) Estado_Nombre
FROM
(
	SELECT --TOP 40
		Id,
	Codigo,
	Nombre,
	Unidad, 
	Int_Sucursal_Id, 
	Apu_Subtitulo_id,
	Int_Moneda_Id,
	Rendimiento_Mano_Obra,
	Rendimiento_Equipo,
	Especial,
	Disponible,
	Descripcion,   
	Fecha_Creacion,
	Creacion_Per_Personal_Id,
	Fecha_Update,
	Update_Per_Personal_Id,
	Estado,

    ROW_NUMBER() OVER (ORDER BY Codigo) AS RowNumber
	
	FROM Apu_Rubro
	WHERE Int_Sucursal_Id= @p_Int_Sucursal_Id
	AND Codigo between CONVERT(NUMERIC,@p_Codigo_Desde) AND CONVERT(NUMERIC,@p_Codigo_Hasta)
	AND Nombre like @p_Nombre
	AND    dbo._Apu_Subtitulo_Codigo (Apu_Subtitulo_Id)  between CONVERT(NUMERIC,@p_Apu_Subtitulo_Codigo_Desde) AND CONVERT(NUMERIC,@p_Apu_Subtitulo_Codigo_Hasta)
	AND dbo._Apu_Subtitulo_Nombre (Apu_Subtitulo_Id) like @p_Apu_Subtitulo_Nombre
	AND dbo._Apu_Titulo_Codigo (dbo._Apu_Subtitulo_Apu_Titulo_Id (Apu_Subtitulo_Id)) 
		between CONVERT(NUMERIC,@p_Apu_Titulo_Codigo_Desde) AND CONVERT(NUMERIC,@p_Apu_Titulo_Codigo_Hasta)
	AND dbo._Apu_Titulo_Nombre (dbo._Apu_Subtitulo_Apu_Titulo_Id (Apu_Subtitulo_Id)) like @p_Apu_Titulo_Nombre

) Apu_Rubro
WHERE RowNumber > (@p_Numero_Registros * (@p_Pagina_Actual-1)) 
AND RowNumber <= (@p_Numero_Registros * (@p_Pagina_Actual))
