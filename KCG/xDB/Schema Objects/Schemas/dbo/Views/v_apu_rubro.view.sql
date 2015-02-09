CREATE view [dbo].[v_apu_rubro] as
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
  -- Empresa y sucursal
    dbo._int_sucursal_codigo (Int_Sucursal_Id) 
		Int_Sucursal_Codigo,
    dbo._int_sucursal_nombre (Int_Sucursal_Id) 
		Int_Sucursal_Nombre,
    dbo._int_sucursal_int_empresa_id (Int_Sucursal_Id) 
		Int_Empresa_Id,
    dbo._int_empresa_codigo (dbo._int_sucursal_int_empresa_id (Int_Sucursal_Id)) 
		Int_Empresa_Codigo,
    dbo._int_empresa_nombre (dbo._int_sucursal_int_empresa_id (Int_Sucursal_Id)) 
		Int_Empresa_Nombre,
  -- Moneda
    dbo._Int_Moneda_Codigo (Int_Moneda_Id) 
		Int_Moneda_Codigo,
    dbo._Int_Moneda_Nombre (int_Moneda_Id) 
		Int_Moneda_Nombre,
    dbo._Int_Moneda_Simbolo (int_Moneda_Id) Int_Moneda_Simbolo,
  -- Titulo, Subtitulo y Personas
    dbo._Apu_Subtitulo_Codigo (Apu_Subtitulo_Id) 
		Apu_Subtitulo_Codigo,
    dbo._Apu_Subtitulo_Nombre (Apu_Subtitulo_Id) 
		Apu_Subtitulo_Nombre,
    dbo._Apu_Subtitulo_Apu_Titulo_id (Apu_Subtitulo_Id) 
		Apu_Titulo_id,
    dbo._Apu_Titulo_Codigo (dbo._Apu_Subtitulo_apu_titulo_id (Apu_Subtitulo_Id)) 
		Apu_Titulo_Codigo,
    dbo._Apu_Titulo_Nombre (dbo._Apu_Subtitulo_apu_titulo_id (Apu_Subtitulo_Id)) 
		Apu_Titulo_Nombre,
    dbo._per_personal_Codigo (Creacion_Per_Personal_Id) 
		Creacion_Per_Personal_Codigo,
    dbo._per_personal_Nombre (Creacion_Per_Personal_Id) 
		Creacion_Per_Personal_Nombre,
    dbo._per_personal_Codigo (Update_Per_Personal_Id) 
		Update_Per_Personal_Codigo,
    dbo._per_personal_Nombre (Update_Per_Personal_Id) 
		Update_Per_Personal_Nombre,
  -- Fechas últimas de modificacion
    GetDate()		Apu_rubro_material_ultima_fecha_update,
    GetDate() 		Apu_rubro_transporte_ultima_fecha_update,
    GetDate()		Apu_rubro_mano_obra_ultima_fecha_update,
    GetDate()		Apu_rubro_equipo_ultima_fecha_update,

  -- Rendimientos
    dbo._Apu_Rubro_Rendimiento_Mano_Obra_Hora_R (Rendimiento_Mano_Obra) 
		Rendimiento_Mano_Obra_Hora,
    dbo._Apu_Rubro_Rendimiento_Equipo_Hora_R (Rendimiento_Equipo) 
		Rendimiento_Equipo_Hora,
  -- Costo directo
    dbo._apu_rubro_material_costo_total(id) Apu_rubro_material_costo_total, 
    dbo._apu_rubro_mano_obra_costo_total_rendimiento(id) Apu_rubro_mano_obra_costo_total, 
    dbo._apu_rubro_equipo_costo_total_rendimiento(id) Apu_rubro_equipo_costo_total, 
    dbo._apu_rubro_transporte_costo_total(id)Apu_rubro_transporte_costo_total,
  -- Costo indirecto
    dbo._apu_parametros_porcentaje_costo_indirecto(int_sucursal_id) 
		Porcentaje_costo_indirecto

FROM  Apu_Rubro













