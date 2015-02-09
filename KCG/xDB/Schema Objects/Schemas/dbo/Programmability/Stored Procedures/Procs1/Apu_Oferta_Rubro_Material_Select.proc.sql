CREATE PROCEDURE [dbo].[Apu_Oferta_Rubro_Material_Select]
(
   @p_Ver_Version_Id varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT     
    Id,
    Codigo, 
    Apu_Oferta_Rubro_Id,
    Apu_Material_Id,
    Costo, 
    Costo_Transporte,
    Fecha_Creacion,
    Creacion_Per_Personal_Id,
    Fecha_Update,
    Update_Per_Personal_Id,
    Fecha_UpdateTransporte,
    UpdateTransporte_Per_Personal_Id,
    Estado,
    
    dbo._Apu_Oferta_Rubro_Codigo (Apu_Oferta_Rubro_Id) Apu_Oferta_Rubro_Codigo,
    
    dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (Apu_Oferta_rubro_Id) Apu_Oferta_Id,
    dbo._Apu_Oferta_Codigo ( dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (Apu_Oferta_rubro_Id)) Apu_Oferta_Codigo,
    dbo._Apu_Oferta_Nombre ( dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (Apu_Oferta_rubro_Id)) Apu_Oferta_Nombre,
    dbo._Apu_Oferta_Etapa ( dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (Apu_Oferta_rubro_Id)) Apu_Oferta_Etapa,

    dbo._Apu_Oferta_Rubro_Apu_Rubro_Id (Apu_Oferta_Rubro_Id) Apu_Rubro_Id,
    dbo._Apu_Rubro_Codigo ( dbo._Apu_Oferta_Rubro_Apu_Rubro_Id (Apu_Oferta_Rubro_Id)) Apu_Rubro_Codigo,
    dbo._Apu_Rubro_Nombre ( dbo._Apu_Oferta_Rubro_Apu_Rubro_Id (Apu_Oferta_Rubro_Id)) Apu_Rubro_Nombre,
    dbo._Apu_Rubro_Unidad ( dbo._Apu_Oferta_Rubro_Apu_Rubro_Id (Apu_Oferta_Rubro_Id)) Apu_Rubro_Unidad,

    dbo._Apu_Material_Codigo (Apu_Material_Id) Apu_Material_Codigo,
    dbo._Apu_Material_Nombre (Apu_Material_Id) Apu_Material_Nombre,
    dbo._Apu_Material_Unidad (Apu_Material_Id) Apu_Material_Unidad,

    dbo._Per_Personal_Codigo (Creacion_Per_Personal_Id) Creacion_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (Creacion_Per_Personal_Id) Creacion_Per_Personal_Nombre,
    
    dbo._Per_Personal_Codigo (Update_Per_Personal_Id) Update_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (Update_Per_Personal_Id) Update_Per_Personal_Nombre,
     
    dbo._Per_Personal_Codigo (UpdateTransporte_Per_Personal_Id) UpdateTransporte_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (UpdateTransporte_Per_Personal_Id) UpdateTransporte_Per_Personal_Nombre,
    
    dbo._Apu_Oferta_Rubro_Int_Moneda_Simbolo (apu_Oferta_rubro_id) int_moneda_simbolo,
              
    dbo.Estado ('APU_OFERTA_RUBRO_MATERIAL', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre,

    dbo._Apu_Oferta_Rubro_Material_Costo_X_Cantidad          (id) costo_total,
    dbo._Apu_Oferta_Rubro_Transporte_Costo_X_Cantidad        (id) costo_total_transporte
    

FROM         Apu_Oferta_Rubro_Material


