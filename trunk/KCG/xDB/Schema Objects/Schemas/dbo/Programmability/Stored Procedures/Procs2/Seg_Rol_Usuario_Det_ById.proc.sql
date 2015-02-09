CREATE PROCEDURE [dbo].[Seg_Rol_Usuario_Det_ById]
(
   @p_Ver_Version_Id varchar (17) ,
   @p_Id varchar(17)
)
AS
	SET NOCOUNT ON;
SELECT     
    Id, 
    Codigo, 
    Seg_Rol_Usuario_Id, 
    Int_Sucursal_Id, 
    Estado,

    dbo._Seg_Rol_Usuario_Codigo (seg_rol_usuario_id) seg_rol_usuario_codigo,
    dbo._Seg_Rol_Usuario_Nombre (seg_rol_usuario_id) seg_rol_usuario_nombre,

    dbo._Int_Sucursal_Codigo (int_sucursal_id) Int_Sucursal_Codigo,
    dbo._Int_Sucursal_Nombre (Int_sucursal_Id) Int_Sucursal_Nombre,

    dbo._Int_Sucursal_Int_Empresa_Id (Int_Sucursal_Id) Int_Empresa_Id,
    dbo._Int_Empresa_Codigo (dbo._Int_Sucursal_Int_Empresa_Id (Int_Sucursal_Id)) Int_Empresa_Codigo,
    dbo._Int_Empresa_Nombre (dbo._Int_Sucursal_Int_Empresa_Id (Int_Sucursal_Id)) Int_Empresa_Nombre,

    dbo._Int_Sucursal_Int_Moneda_Id (Int_Sucursal_Id) Int_Moneda_Id,
    dbo._Int_Moneda_Codigo (dbo._Int_Sucursal_Int_Moneda_Id (Int_Sucursal_Id)) Int_Moneda_Codigo,
    dbo._Int_Moneda_Nombre (dbo._Int_Sucursal_Int_Moneda_Id (Int_Sucursal_Id)) Int_Moneda_Nombre,

    dbo._Seg_Rol_Usuario_Seg_Rol_Id (Seg_Rol_Usuario_Id) seg_rol_id,
    dbo._Seg_Rol_Codigo (dbo._Seg_Rol_Usuario_Seg_Rol_Id(Seg_Rol_Usuario_Id)) seg_rol_Codigo,
    dbo._Seg_Rol_Nombre (dbo._Seg_Rol_Usuario_Seg_Rol_Id(Seg_Rol_Usuario_Id)) seg_rol_Nombre,
    
    dbo._Seg_Rol_Usuario_Int_Usuario_Id(Seg_Rol_Usuario_Id) int_usuario_id, 
    dbo._Int_Usuario_Codigo (dbo._Seg_Rol_Usuario_Int_Usuario_Id(Seg_Rol_Usuario_Id)) int_usuario_Codigo,
    dbo._Int_Usuario_Nombre (dbo._Seg_Rol_Usuario_Int_Usuario_Id(Seg_Rol_Usuario_Id)) int_usuario_Nombre,


    dbo.Estado ('SEG_ROL_USUARIO_DET','ESTADO', estado, @p_ver_version_id) Estado_nombre

FROM  Seg_Rol_Usuario_Det
where Id=@p_Id




