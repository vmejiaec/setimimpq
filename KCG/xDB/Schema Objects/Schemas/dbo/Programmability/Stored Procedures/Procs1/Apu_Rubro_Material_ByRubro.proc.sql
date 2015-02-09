CREATE PROCEDURE [dbo].[Apu_Rubro_Material_ByRubro]
(
   @p_Ver_Version_Id varchar (17),
   @p_Apu_Rubro_Id varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT     
    Id,
    Codigo, 
    Apu_Rubro_Id,
    Apu_Material_Id,
    Cantidad, 
    Fecha_Update,
    Update_Per_Personal_Id,
    Fecha_Creacion,
    Creacion_Per_Personal_Id,
    UpdateTransporte_Per_Personal_Id,
    Fecha_UpdateTransporte,
    Estado,

    dbo._Apu_Rubro_Codigo (Apu_Rubro_Id) Apu_Rubro_Codigo,
    dbo._Apu_Rubro_Nombre (Apu_Rubro_Id) Apu_Rubro_Nombre,
    dbo._Apu_Rubro_Unidad (Apu_Rubro_Id) Apu_Rubro_Unidad,

    dbo._Apu_Material_Codigo (Apu_Material_Id) Apu_Material_Codigo,
    dbo._Apu_Material_Nombre (Apu_Material_Id) Apu_Material_Nombre,
    dbo._Apu_Material_Unidad (Apu_Material_Id) Apu_Material_Unidad,
  
    dbo._Per_Personal_Codigo (Creacion_Per_Personal_Id) Creacion_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (Creacion_Per_Personal_Id) Creacion_Per_Personal_Nombre,
    
    dbo._Per_Personal_Codigo (Update_Per_Personal_Id) Update_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (Update_Per_Personal_Id) Update_Per_Personal_Nombre,
     
    dbo._Per_Personal_Codigo (UpdateTransporte_Per_Personal_Id) UpdateTransporte_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (UpdateTransporte_Per_Personal_Id) UpdateTransporte_Per_Personal_Nombre,
    
    dbo._Apu_Material_Costo_Total (apu_material_id) costo_unitario,
    dbo._Apu_Transporte_Costo_Total (apu_material_id) costo_unitario_transporte,
    dbo._Apu_Rubro_Material_Costo_Total1 (id) costo_total,
    dbo._Apu_Rubro_Transporte_Costo_Total1 (id) costo_total_transporte,
    
    dbo._Apu_Rubro_Int_Moneda_Simbolo (apu_rubro_id) int_moneda_simbolo,
              
    dbo.Estado ('APU_RUBRO_MATERIAL', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre,
    
    dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id) Apu_Subtitulo_id,
    dbo._Apu_Subtitulo_Codigo (dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id)) Apu_Subtitulo_Codigo,
    dbo._Apu_Subtitulo_Nombre (dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id)) Apu_Subtitulo_Nombre,

    dbo._Apu_Subtitulo_Apu_Titulo_Id (dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id)) Apu_Titulo_Id,
    dbo._Apu_Titulo_Codigo (dbo._Apu_Subtitulo_Apu_Titulo_Id (dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id))) Apu_Titulo_Codigo,
    dbo._Apu_Titulo_Nombre (dbo._Apu_Subtitulo_Apu_Titulo_Id (dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id))) Apu_Titulo_Nombre

FROM         Apu_Rubro_Material
Where  Apu_Rubro_Id = @p_Apu_Rubro_Id















