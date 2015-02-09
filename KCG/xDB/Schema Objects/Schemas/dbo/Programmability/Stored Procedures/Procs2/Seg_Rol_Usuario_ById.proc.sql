CREATE PROCEDURE [dbo].[Seg_Rol_Usuario_ById]
(
  @p_Ver_Version_Id varchar (17),
  @p_Id varchar(17)
)
AS
	SET NOCOUNT ON;
SELECT     
   Id, 
   Codigo, 
   Seg_Rol_Id, 
   Int_Usuario_Id, 
   Estado,

   dbo._Seg_Rol_Codigo (Seg_rol_Id) Seg_Rol_Codigo,
   dbo._Seg_Rol_Nombre (Seg_rol_Id) Seg_Rol_Nombre,

   dbo._Int_Usuario_Codigo (int_usuario_id) Int_usuario_codigo,
   dbo._Int_Usuario_Nombre (int_usuario_id) Int_usuario_nombre,

   dbo.Estado ('SEG_ROL_USUARIO','ESTADO', estado, @p_ver_version_id) Estado_nombre
FROM         Seg_Rol_Usuario
where Id=@p_Id


