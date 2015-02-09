
CREATE PROCEDURE [dbo].[Seg_Rol_Usuario_ByRol]
(
  @p_Ver_Version_Id varchar (17),
  @p_Seg_Rol_Id varchar(17)
)
AS
	SET NOCOUNT ON;
SELECT     
   Id, 
   Codigo, 
   Seg_Rol_Id, 
   Int_Usuario_Id, 
   Estado,

   dbo._Seg_Rol_Codigo (Seg_Rol_Id) Seg_Rol_Codigo,
   dbo._Seg_Rol_Nombre (Seg_Rol_Id) Seg_Rol_Nombre,

   dbo._Int_Usuario_Codigo (Int_Usuario_Id) Int_usuario_codigo,
   dbo._Int_Usuario_Nombre (Int_Usuario_Id) Int_usuario_nombre,

   dbo.Estado ('SEG_ROL_USUARIO','ESTADO', Estado, @p_Ver_Version_Id) Estado_nombre
FROM         Seg_Rol_Usuario
where Seg_Rol_Id = @p_Seg_Rol_Id
