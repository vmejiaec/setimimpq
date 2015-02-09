CREATE PROCEDURE [dbo].[Apu_Rubro_Insumo_BybASURA]
(
   @p_Ver_Version_Id varchar (17),
   @p_Int_sucursal_id varchar (17)
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
    'MAT' Tipo
    
FROM         Apu_Rubro_Material
--Where dbo._Apu_Rubro_Int_Sucursal_Id (Apu_Rubro_Id) = @p_int_sucursal_id
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
    'TRA' Tipo
    
FROM         Apu_Rubro_Material
--Where dbo._Apu_Rubro_Int_Sucursal_Id (Apu_Rubro_Id) = @p_int_sucursal_id
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
    'MAN' Tipo
    
FROM         Apu_Rubro_Mano_Obra
--Where dbo._Apu_Rubro_Int_Sucursal_Id (Apu_Rubro_Id) = @p_int_sucursal_id
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
    'EQU' Tipo
    
FROM  Apu_Rubro_Equipo
--Where dbo._Apu_Rubro_Int_Sucursal_Id (Apu_Rubro_Id) = @p_int_sucursal_id















