CREATE PROCEDURE [dbo].[Apu_Rubro_Insumo_ByRubro]
(
   @p_Ver_Version_Id varchar (17),
   @p_apu_rubro_id varchar(17)
)
AS
	SET NOCOUNT ON;

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
    dbo.Dominio ('APU_RUBRO_INSUMO', 'TIPO', 'MAT', @p_Ver_Version_Id ) Tipo_Nombre,

    dbo._Apu_Rubro_Codigo (Apu_Rubro_Id) Apu_Rubro_Codigo,
    dbo._Apu_Rubro_Nombre (Apu_Rubro_Id) Apu_Rubro_Nombre,
    dbo._Apu_Rubro_Unidad (Apu_Rubro_Id) Apu_Rubro_Unidad,
    dbo._Apu_Rubro_Int_Sucursal_Id (Apu_Rubro_Id) Int_Sucursal_Id,

    dbo._Apu_Material_Codigo (Apu_Material_Id) Apu_Insumo_Codigo,
    dbo._Apu_Material_Nombre (Apu_Material_Id) Apu_Insumo_Nombre,
  
    dbo._Per_Personal_Codigo (Creacion_Per_Personal_Id) Creacion_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (Creacion_Per_Personal_Id) Creacion_Per_Personal_Nombre,
    
    dbo._Per_Personal_Codigo (Update_Per_Personal_Id) Update_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (Update_Per_Personal_Id) Update_Per_Personal_Nombre,
     
    dbo._Apu_Rubro_Material_Costo_Total1 (id) costo,

    dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id) Apu_Subtitulo_id,
    dbo._Apu_Subtitulo_Codigo (dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id)) Apu_Subtitulo_Codigo,
    dbo._Apu_Subtitulo_Nombre (dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id)) Apu_Subtitulo_Nombre,

    dbo._Apu_Subtitulo_Apu_Titulo_Id (dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id)) Apu_Titulo_Id,
    dbo._Apu_Titulo_Codigo (dbo._Apu_Subtitulo_Apu_Titulo_Id (dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id))) Apu_Titulo_Codigo,
    dbo._Apu_Titulo_Nombre (dbo._Apu_Subtitulo_Apu_Titulo_Id (dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id))) Apu_Titulo_Nombre,

    dbo._Apu_Rubro_Costo_Indirecto (apu_rubro_id, dbo._Apu_Rubro_Int_Sucursal_Id (apu_rubro_id)) Costo_Indirecto,
    dbo._Apu_Rubro_Costo_Directo (apu_rubro_id) Costo_Directo,
    dbo._Apu_Rubro_Costo_Total  (apu_rubro_id, dbo._Apu_Rubro_Int_Sucursal_Id (apu_rubro_id)) Costo_Total

FROM         Apu_Rubro_Material
where apu_rubro_id = @p_apu_rubro_id
UNION
SELECT     
    Id,
    Codigo, 
    Apu_Rubro_Id,
    Apu_Material_Id,
    Cantidad, 
    Fecha_UpdateTransporte Fecha_Update,
    UpdateTransporte_Per_Personal_Id Update_Per_Personal_Id,
    Fecha_Creacion,
    Creacion_Per_Personal_Id,
    Estado,
    'TRA' Tipo,
    dbo.Dominio ('APU_RUBRO_INSUMO', 'TIPO', 'TRA', @p_Ver_Version_Id ) Tipo_Nombre,

    dbo._Apu_Rubro_Codigo (Apu_Rubro_Id) Apu_Rubro_Codigo,
    dbo._Apu_Rubro_Nombre (Apu_Rubro_Id) Apu_Rubro_Nombre,
    dbo._Apu_Rubro_Unidad (Apu_Rubro_Id) Apu_Rubro_Unidad,
    dbo._Apu_Rubro_Int_Sucursal_Id (Apu_Rubro_Id) Int_Sucursal_Id,

    dbo._Apu_Material_Codigo (Apu_Material_Id) Apu_Insumo_Codigo,
    dbo._Apu_Material_Nombre (Apu_Material_Id) Apu_Insumo_Nombre,
  
    dbo._Per_Personal_Codigo (Creacion_Per_Personal_Id) Creacion_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (Creacion_Per_Personal_Id) Creacion_Per_Personal_Nombre,
    
    dbo._Per_Personal_Codigo (UpdateTransporte_Per_Personal_Id) Update_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (UpdateTransporte_Per_Personal_Id) Update_Per_Personal_Nombre,
    
    dbo._Apu_Rubro_Transporte_Costo_Total1 (id) costo,

    dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id) Apu_Subtitulo_id,
    dbo._Apu_Subtitulo_Codigo (dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id)) Apu_Subtitulo_Codigo,
    dbo._Apu_Subtitulo_Nombre (dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id)) Apu_Subtitulo_Nombre,

    dbo._Apu_Subtitulo_Apu_Titulo_Id (dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id)) Apu_Titulo_Id,
    dbo._Apu_Titulo_Codigo (dbo._Apu_Subtitulo_Apu_Titulo_Id (dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id))) Apu_Titulo_Codigo,
    dbo._Apu_Titulo_Nombre (dbo._Apu_Subtitulo_Apu_Titulo_Id (dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id))) Apu_Titulo_Nombre,

	dbo._Apu_Rubro_Costo_Indirecto (apu_rubro_id, dbo._Apu_Rubro_Int_Sucursal_Id (apu_rubro_id)) Costo_Indirecto,
    dbo._Apu_Rubro_Costo_Directo (apu_rubro_id) Costo_Directo,
    dbo._Apu_Rubro_Costo_Total  (apu_rubro_id, dbo._Apu_Rubro_Int_Sucursal_Id (apu_rubro_id)) Costo_Total
    
FROM         Apu_Rubro_Material
where apu_rubro_id = @p_apu_rubro_id
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
    dbo.Dominio ('APU_RUBRO_INSUMO', 'TIPO', 'MAN', @p_Ver_Version_Id ) Tipo_Nombre,

    dbo._Apu_Rubro_Codigo (Apu_Rubro_Id) Apu_Rubro_Codigo,
    dbo._Apu_Rubro_Nombre (Apu_Rubro_Id) Apu_Rubro_Nombre,
    dbo._Apu_Rubro_Unidad (Apu_Rubro_Id) Apu_Rubro_Unidad,
    dbo._Apu_Rubro_Int_Sucursal_Id (Apu_Rubro_Id) Int_Sucursal_Id,

    dbo._Apu_Mano_Obra_Codigo (Apu_Mano_Obra_Id) Apu_Insumo_Codigo,
    dbo._Apu_Mano_Obra_Nombre (Apu_Mano_Obra_Id) Apu_Insumo_Nombre,
  
    dbo._Per_Personal_Codigo (Creacion_Per_Personal_Id) Creacion_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (Creacion_Per_Personal_Id) Creacion_Per_Personal_Nombre,
    
    dbo._Per_Personal_Codigo (Update_Per_Personal_Id) Update_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (Update_Per_Personal_Id) Update_Per_Personal_Nombre,

    dbo._Apu_Rubro_Mano_Obra_Costo_X_Rendimiento (id) costo,
     

    dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id) Apu_Subtitulo_id,
    dbo._Apu_Subtitulo_Codigo (dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id)) Apu_Subtitulo_Codigo,
    dbo._Apu_Subtitulo_Nombre (dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id)) Apu_Subtitulo_Nombre,

    dbo._Apu_Subtitulo_Apu_Titulo_Id (dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id)) Apu_Titulo_Id,
    dbo._Apu_Titulo_Codigo (dbo._Apu_Subtitulo_Apu_Titulo_Id (dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id))) Apu_Titulo_Codigo,
    dbo._Apu_Titulo_Nombre (dbo._Apu_Subtitulo_Apu_Titulo_Id (dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id))) Apu_Titulo_Nombre,

	dbo._Apu_Rubro_Costo_Indirecto (apu_rubro_id, dbo._Apu_Rubro_Int_Sucursal_Id (apu_rubro_id)) Costo_Indirecto,
    dbo._Apu_Rubro_Costo_Directo (apu_rubro_id) Costo_Directo,
    dbo._Apu_Rubro_Costo_Total  (apu_rubro_id, dbo._Apu_Rubro_Int_Sucursal_Id (apu_rubro_id)) Costo_Total


FROM         Apu_Rubro_Mano_Obra
where apu_rubro_id = @p_apu_rubro_id
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
    dbo.Dominio ('APU_RUBRO_INSUMO', 'TIPO', 'EQU', @p_Ver_Version_Id ) Tipo_Nombre,

    dbo._Apu_Rubro_Codigo (Apu_Rubro_Id) Apu_Rubro_Codigo,
    dbo._Apu_Rubro_Nombre (Apu_Rubro_Id) Apu_Rubro_Nombre,
    dbo._Apu_Rubro_Unidad (Apu_Rubro_Id) Apu_Rubro_Unidad,
    dbo._Apu_Rubro_Int_Sucursal_Id (Apu_Rubro_Id) Int_Sucursal_Id,

    dbo._Apu_Equipo_Codigo (Apu_Equipo_Id) Apu_Insumo_Codigo,
    dbo._Apu_Equipo_Nombre (Apu_Equipo_Id) Apu_Insumo_Nombre,
  
    dbo._Per_Personal_Codigo (Creacion_Per_Personal_Id) Creacion_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (Creacion_Per_Personal_Id) Creacion_Per_Personal_Nombre,
    
    dbo._Per_Personal_Codigo (Update_Per_Personal_Id) Update_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (Update_Per_Personal_Id) Update_Per_Personal_Nombre,

    dbo._Apu_Rubro_Equipo_Costo_X_Rendimiento (id) costo,
     

    dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id) Apu_Subtitulo_id,
    dbo._Apu_Subtitulo_Codigo (dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id)) Apu_Subtitulo_Codigo,
    dbo._Apu_Subtitulo_Nombre (dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id)) Apu_Subtitulo_Nombre,

    dbo._Apu_Subtitulo_Apu_Titulo_Id (dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id)) Apu_Titulo_Id,
    dbo._Apu_Titulo_Codigo (dbo._Apu_Subtitulo_Apu_Titulo_Id (dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id))) Apu_Titulo_Codigo,
    dbo._Apu_Titulo_Nombre (dbo._Apu_Subtitulo_Apu_Titulo_Id (dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id))) Apu_Titulo_Nombre,

	dbo._Apu_Rubro_Costo_Indirecto (apu_rubro_id, dbo._Apu_Rubro_Int_Sucursal_Id (apu_rubro_id)) Costo_Indirecto,
    dbo._Apu_Rubro_Costo_Directo (apu_rubro_id) Costo_Directo,
    dbo._Apu_Rubro_Costo_Total  (apu_rubro_id, dbo._Apu_Rubro_Int_Sucursal_Id (apu_rubro_id)) Costo_Total

FROM  Apu_Rubro_Equipo
where apu_rubro_id = @p_apu_rubro_id












