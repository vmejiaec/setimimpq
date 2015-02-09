


CREATE PROCEDURE [dbo].[Apu_Proyecto_Rubro_Material_ByRubro]
(
   @p_Ver_Version_Id varchar (17),
   @p_Apu_Proyecto_Rubro_id varchar(17) 
)
AS
	SET NOCOUNT ON;
declare
   @v_apu_Proyecto_Id varchar(17)

   Set @v_apu_Proyecto_Id = dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (@p_Apu_Proyecto_Rubro_id);

SELECT     
    Id,
    Codigo, 
    Apu_Proyecto_Rubro_Id,
    Apu_Material_Id,
    Cantidad, 
    Fecha_Update,
    Update_Per_Personal_Id,
    Fecha_Creacion,
    Creacion_Per_Personal_Id,
    UpdateTransporte_Per_Personal_Id,
    Fecha_UpdateTransporte,
    Estado,
    
    dbo._Apu_Proyecto_Rubro_Codigo (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Codigo,
    
    dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id) Apu_Proyecto_Id,
    dbo._Apu_Proyecto_Codigo ( dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Codigo,
    dbo._Apu_Proyecto_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Nombre,
    dbo._Apu_Proyecto_Etapa ( dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Etapa,

    dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id) Apu_Rubro_Id,
    dbo._Apu_Rubro_Codigo ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Codigo,
    dbo._Apu_Rubro_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Nombre,
    dbo._Apu_Rubro_Unidad ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Unidad,

    dbo._Apu_Material_Codigo (Apu_Material_Id) Apu_Material_Codigo,
    dbo._Apu_Material_Nombre (Apu_Material_Id) Apu_Material_Nombre,
    dbo._Apu_Material_Unidad (Apu_Material_Id) Apu_Material_Unidad,
    dbo._Apu_Material_Costo_Parcial (Apu_Material_Id)Apu_Material_Costo_Parcial,
    dbo._Apu_Material_Costo_Otros (Apu_Material_Id)  Apu_Material_Costo_Otros,

    dbo._Per_Personal_Codigo (Creacion_Per_Personal_Id) Creacion_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (Creacion_Per_Personal_Id) Creacion_Per_Personal_Nombre,
    
    dbo._Per_Personal_Codigo (Update_Per_Personal_Id) Update_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (Update_Per_Personal_Id) Update_Per_Personal_Nombre,
     
    dbo._Per_Personal_Codigo (UpdateTransporte_Per_Personal_Id) UpdateTransporte_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (UpdateTransporte_Per_Personal_Id) UpdateTransporte_Per_Personal_Nombre,
    
    dbo._Apu_Proyecto_Rubro_Material_Costo_Diario                     (id) costo_unitario,
    dbo._Apu_Proyecto_Rubro_Material_Transporte_Costo_Diario          (id) costo_unitario_transporte,
    dbo._Apu_Proyecto_Rubro_Material_Costo_Diario_X_Cantidad          (id,@v_apu_Proyecto_Id) costo_total,
    dbo._Apu_Proyecto_Rubro_Material_Transporte_Costo_Diario_X_Cantidad (id,@v_apu_Proyecto_Id) costo_total_transporte,
    
    dbo._Apu_Proyecto_Rubro_Int_Moneda_Simbolo (apu_proyecto_rubro_id) int_moneda_simbolo,
              
    dbo.Estado ('APU_PROYECTO_RUBRO_MATERIAL', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre

FROM         Apu_Proyecto_Rubro_Material
Where  Apu_Proyecto_Rubro_Id = @p_Apu_Proyecto_Rubro_id






















