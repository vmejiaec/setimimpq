CREATE PROCEDURE [dbo].[Int_Usuario_Select]
(
  @p_Ver_Version_id varchar(17)
)
AS
	SET NOCOUNT ON;
SELECT     
   Id, 
   Codigo, 
   Nombre,
   'NULL' Password,
   Usuario_Id_Ref, 
   Per_Personal_Id,
   Pred_Seg_Rol_Id,
   Pred_Ver_Version_Id, 
   Pred_Int_Sucursal_Id,
   'NULL' Salt,
   Estado,

   dbo._Per_Personal_Codigo (Per_Personal_Id) Per_Personal_Codigo,
   dbo._Per_Personal_Nombre (Per_Personal_Id) Per_Personal_Nombre, 

   dbo._Seg_Rol_Codigo (Pred_Seg_Rol_Id) Pred_seg_Rol_Codigo,
   dbo._Seg_Rol_Nombre (Pred_Seg_Rol_Id) Pred_seg_Rol_Nombre,
   dbo._Ver_Version_Codigo (pred_ver_version_id) Pred_ver_version_codigo,
   dbo._Ver_Version_Nombre (pred_ver_version_id) Pred_ver_version_nombre,

   dbo._Ver_Version_Abreviatura(pred_ver_version_id) Pred_Ver_Version_Abreviatura,
    
   dbo._Int_Sucursal_Codigo (pred_int_sucursal_id) Pred_int_Usuario_codigo,
   dbo._Int_Sucursal_Nombre (pred_int_sucursal_id) Pred_Int_Usuario_nombre,
   dbo._Int_Sucursal_Int_Empresa_Id (pred_int_sucursal_Id) int_empresa_id,
   dbo._Int_Empresa_Codigo (dbo._Int_Sucursal_Int_Empresa_Id (pred_int_sucursal_Id)) int_empresa_codigo,
   dbo._Int_Empresa_Nombre (dbo._Int_Sucursal_Int_Empresa_Id (pred_int_sucursal_Id)) int_empresa_nombre,
   dbo.Estado ('INT_USUARIO','ESTADO', estado, @p_ver_version_id) estado_nombre,

   dbo.Per_Personal_Jefe_Fiscalizacion( Per_Personal_Id) Jefe_Fiscalizacion

FROM  Int_Usuario
























