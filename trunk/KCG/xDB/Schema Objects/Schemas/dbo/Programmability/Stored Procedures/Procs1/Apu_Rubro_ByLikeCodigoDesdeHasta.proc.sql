CREATE PROCEDURE [dbo].[Apu_Rubro_ByLikeCodigoDesdeHasta]
(
  @p_Ver_Version_Id VARCHAR(17),
  @p_desde_Codigo varchar (200),
  @p_hasta_Codigo varchar (200),
  @p_int_sucursal_Id varchar(17)
)
AS
	SET NOCOUNT ON;
	DECLARE	@id_inicial VARCHAR(17);
	DECLARE	@id_final VARCHAR(17);
	declare @v_dic_objeto_id varchar(17);
	declare @v_dic_campo_id varchar(17);

	-- Consulta los ids de objeto y campo
		exec @v_dic_objeto_id = _dic_objeto_id 
				'APU_RUBRO'
		exec @v_dic_campo_id = _dic_campo_Id 
				@v_dic_objeto_id, 
				'DISPONIBLE'

	-- Consulta principal
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
			Int_Sucursal_Codigo, --
			Int_Sucursal_Nombre, --
			Int_Empresa_Id,      --
			Int_Empresa_Codigo,  --
			Int_Empresa_Nombre,  --
	  -- Moneda
			Int_Moneda_Codigo,  --
			Int_Moneda_Nombre,  --
			Int_Moneda_Simbolo, --
	  -- Titulo, Subtitulo y Personas
			Apu_Subtitulo_Codigo, --
			Apu_Subtitulo_Nombre, --
			Apu_Titulo_id,        --
			Apu_Titulo_Codigo,    --
			Apu_Titulo_Nombre,    --
			Creacion_Per_Personal_Codigo ,  --
			Creacion_Per_Personal_Nombre, --
			Update_Per_Personal_Codigo,   --
			Update_Per_Personal_Nombre,   --
	  -- Fechas últimas de modificacion
			Apu_rubro_material_ultima_fecha_update,   --
			Apu_rubro_transporte_ultima_fecha_update, --
			Apu_rubro_mano_obra_ultima_fecha_update,  --
			Apu_rubro_equipo_ultima_fecha_update,     --
	  -- Rendimientos
			Rendimiento_Mano_Obra_Hora, --
			Rendimiento_Equipo_Hora,    --
	  -- Costo directo
			Apu_rubro_material_costo_total,   --
			Apu_rubro_mano_obra_costo_total,  --
  			Apu_rubro_equipo_costo_total,     --
			Apu_rubro_transporte_costo_total, --
	  -- Costo material + transporte
		dbo.__Suma_Cuatro_Decimales_2 (
				Apu_rubro_material_costo_total,
				Apu_rubro_transporte_costo_total)
  			Apu_rubro_material_transporte_costo_total, --
	  -- Porcentaje Costo indirecto
			Porcentaje_costo_indirecto, --
	  -- Costo directo, indirecto y total
		dbo.__Suma_Cuatro_Decimales_4(
				Apu_rubro_material_costo_total,
				Apu_rubro_mano_obra_costo_total,
				Apu_rubro_equipo_costo_total,
				Apu_rubro_transporte_costo_total)
			Costo_Directo, -- --------------------------------------- Costo Directo 
		dbo.__Porcentaje_Cuatro_Decimales(
				dbo.__Suma_Cuatro_Decimales_4(
						Apu_rubro_material_costo_total,
						Apu_rubro_mano_obra_costo_total,
						Apu_rubro_equipo_costo_total,
						Apu_rubro_transporte_costo_total),
				Porcentaje_costo_indirecto)
			Costo_Indirecto, -- ------------------------------------- Costo Indirecto 
		dbo.__Suma_Cuatro_Decimales_2(
			 dbo.__Suma_Cuatro_Decimales_4(
				Apu_rubro_material_costo_total,
				Apu_rubro_mano_obra_costo_total,
				Apu_rubro_equipo_costo_total,
				Apu_rubro_transporte_costo_total)
			,  
			 dbo.__Porcentaje_Cuatro_Decimales(
				dbo.__Suma_Cuatro_Decimales_4(
						Apu_rubro_material_costo_total,
						Apu_rubro_mano_obra_costo_total,
						Apu_rubro_equipo_costo_total,
						Apu_rubro_transporte_costo_total),
				Porcentaje_costo_indirecto)
		)      
			Costo_Total, -- ----------------------------------------- Costo Total 
		-- Dominios y estado
		dbo.Dominio_Ids(@v_dic_campo_id, Disponible, @p_ver_version_id) 
			Disponible_Nombre, 
		dbo.Dominio_Ids(@v_dic_campo_id, Especial, @p_ver_version_id) 
			Especial_Nombre,   
		dbo.Estado ('APU_RUBRO', 'ESTADO', Estado, @p_Ver_Version_Id ) 
			Estado_Nombre 
	FROM V_Apu_Rubro
	Where Int_Sucursal_Id = @p_int_sucursal_Id 
 and  Convert(numeric,Codigo) >= @p_desde_Codigo
 and  Convert(numeric,Codigo) <= @p_hasta_Codigo
















