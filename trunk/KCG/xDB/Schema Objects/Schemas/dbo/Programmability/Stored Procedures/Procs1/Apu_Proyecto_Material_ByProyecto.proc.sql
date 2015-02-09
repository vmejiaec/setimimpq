CREATE PROCEDURE [dbo].[Apu_Proyecto_Material_ByProyecto]
(
   @p_ver_Version_Id varchar (17),
   @p_apu_proyecto_Id varchar(17)
)
AS
	SET NOCOUNT ON;
SELECT     
    Id,
    Codigo, 
    Apu_Proyecto_Id,
    Apu_Material_Id,
    Costo_Parcial,
    Costo_Otros,
    Costo_Transporte,
    Estado,
    Apu_Indice_Id,

    dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) Apu_Proyecto_Codigo,
    dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id) Apu_Proyecto_Nombre,
    dbo._Apu_Proyecto_Etapa (Apu_Proyecto_Id) Apu_Proyecto_Etapa,

	dbo._Apu_Material_Codigo (Apu_Material_Id) Apu_Material_Codigo,
	dbo._Apu_Material_Nombre (Apu_Material_Id) Apu_Material_Nombre,
    dbo._Apu_Material_Unidad (Apu_Material_Id) Apu_Material_Unidad,
    dbo._Apu_Material_Costo_Total (Apu_Material_Id) Apu_Material_Costo_Total,

    dbo._Apu_Material_Costo_Parcial (Apu_Material_Id) Apu_Material_Costo_Parcial,
    dbo._Apu_Material_Costo_Otros (Apu_Material_Id) Apu_Material_Costo_Otros,

    dbo._Apu_Proyecto_Material_Costo_Total (Id) Costo_Total,
    dbo._Apu_Proyecto_Material_Costo_Total_Costo_Transporte(Id) Costo_Total_Costo_Transporte,

    dbo._Apu_Proyecto_Material_Cantidad_Material (apu_proyecto_id, apu_material_id) Cantidad_Material, 
    dbo._Apu_Proyecto_Material_Cantidad_Material_X_Costo (apu_proyecto_id, apu_material_id) Cantidad_Material_X_Costo, 
    
    dbo._Apu_Indice_Codigo (Apu_Indice_Id) Apu_Indice_Codigo,
	dbo._Apu_Indice_Nombre (Apu_Indice_Id) Apu_Indice_Nombre,
    
    dbo._Apu_Proyecto_Int_Moneda_Simbolo (apu_proyecto_id) Int_Moneda_Simbolo,

              
    dbo.Estado ('APU_PROYECTO_MATERIAL', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre

FROM         Apu_Proyecto_Material
WHERE   Apu_Proyecto_id = @p_apu_proyecto_id
--ORDER BY dbo._apu_proyecto_material_cantidad_material_x_costo (Id) desc



















