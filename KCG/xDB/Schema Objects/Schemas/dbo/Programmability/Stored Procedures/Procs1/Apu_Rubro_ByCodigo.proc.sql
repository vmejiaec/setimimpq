CREATE PROCEDURE [dbo].[Apu_Rubro_ByCodigo]
(
   @p_Ver_Version_Id VARCHAR(17),
   @p_Codigo varchar (200)
)
AS
	SET NOCOUNT ON;
SELECT   
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
     
    ' ' --dbo._int_sucursal_codigo (Int_Sucursal_Id) 
    Int_Sucursal_Codigo,
    ' ' --dbo._int_sucursal_nombre (Int_Sucursal_Id) 
	Int_Sucursal_Nombre,

    ' ' --dbo._int_sucursal_int_empresa_id (Int_Sucursal_Id) 
    Int_Empresa_Id,
    ' ' --dbo._int_empresa_codigo (dbo._int_sucursal_int_empresa_id (Int_Sucursal_Id)) 
    Int_Empresa_Codigo,
    ' ' --dbo._int_empresa_nombre (dbo._int_sucursal_int_empresa_id (Int_Sucursal_Id)) 
    Int_Empresa_Nombre,

    ' ' --dbo._Apu_Subtitulo_Codigo (Apu_Subtitulo_Id) 
    Apu_Subtitulo_Codigo,
    ' ' --dbo._Apu_Subtitulo_Nombre (Apu_Subtitulo_Id) 
    Apu_Subtitulo_Nombre,

    ' ' --dbo._Apu_Subtitulo_Apu_Titulo_id (Apu_Subtitulo_Id) 
    Apu_Titulo_id,
    ' ' --dbo._Apu_Titulo_Codigo (dbo._Apu_Subtitulo_apu_titulo_id (Apu_Subtitulo_Id)) 
    Apu_Titulo_Codigo,
    ' ' --dbo._Apu_Titulo_Nombre (dbo._Apu_Subtitulo_apu_titulo_id (Apu_Subtitulo_Id)) 
	Apu_Titulo_Nombre,

    ' ' --dbo._Int_Moneda_Codigo (Int_Moneda_Id) 
	Int_Moneda_Codigo,
    ' ' --dbo._Int_Moneda_Nombre (int_Moneda_Id) 
	Int_Moneda_Nombre,
    ' ' --dbo._Int_Moneda_Simbolo (int_Moneda_Id) 
	Int_Moneda_Simbolo,

    ' ' --dbo._per_personal_Codigo (Creacion_Per_Personal_Id) 
    Creacion_Per_Personal_Codigo,
    ' ' --dbo._per_personal_Nombre (Creacion_Per_Personal_Id) 
    Creacion_Per_Personal_Nombre,
    
    ' '--dbo._per_personal_Codigo (Update_Per_Personal_Id) 
	Update_Per_Personal_Codigo,
    ' '--dbo._per_personal_Nombre (Update_Per_Personal_Id) 
	Update_Per_Personal_Nombre,
     
    dbo._Apu_Rubro_Rendimiento_Mano_Obra_Hora (id) Rendimiento_Mano_Obra_Hora,
    dbo._Apu_Rubro_Rendimiento_Equipo_Hora (id) Rendimiento_Equipo_Hora,
    
    dbo._Apu_Rubro_Material_Costo_Total    (id) Apu_rubro_material_costo_total,
    dbo._Apu_Rubro_Transporte_Costo_Total  (id) Apu_rubro_transporte_costo_total,

    dbo._Apu_Rubro_Material_Costo_Transporte_Material   (id) Apu_rubro_material_transporte_costo_total,

    dbo._Apu_Rubro_Mano_Obra_Costo_Total_Rendimiento    (id) Apu_rubro_mano_obra_costo_total,
    dbo._Apu_Rubro_Equipo_Costo_Total_Rendimiento       (id) Apu_rubro_equipo_costo_total,

    getDate() --dbo._apu_rubro_material_ultima_fecha_update    (id) 
    Apu_rubro_material_ultima_fecha_update,
    getDate()--dbo._apu_rubro_transporte_ultima_fecha_update    (id) 
    Apu_rubro_transporte_ultima_fecha_update,
    getDate() --dbo._apu_rubro_mano_obra_ultima_fecha_update   (id) 
    Apu_rubro_mano_obra_ultima_fecha_update,
    getDate() --dbo._apu_rubro_equipo_ultima_fecha_update      (id) 
    Apu_rubro_equipo_ultima_fecha_update,

    dbo._Apu_Rubro_Costo_Directo (id) Costo_Directo,
    dbo._Apu_Rubro_Costo_Indirecto (id, int_sucursal_id) Costo_Indirecto,
    dbo._Apu_Rubro_Costo_Total (id, int_sucursal_id)    Costo_Total,
    
    0 --dbo._apu_parametros_porcentaje_costo_indirecto (int_sucursal_id) 
    Porcentaje_costo_indirecto,

    ' ' --dbo.dominio('APU_RUBRO','DISPONIBLE', Disponible, @p_ver_version_id) 
	Disponible_Nombre,
    ' ' --dbo.dominio('APU_RUBRO','ESPECIAL', Especial, @p_ver_version_id) 
    Especial_Nombre,
    ' ' --dbo.estado ('APU_RUBRO', 'ESTADO', Estado, @p_Ver_Version_Id ) 
    Estado_Nombre


FROM         Apu_Rubro
WHERE Codigo = @p_Codigo












