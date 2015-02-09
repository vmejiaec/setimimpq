CREATE PROCEDURE [dbo].[Seg_Rol_Select]
(
   @p_Ver_Version_Id varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT     
   Id, 
   Codigo, 
   Nombre, 
   Descripcion, 
   Estado,
   dbo.Estado ('SEG_ROL','ESTADO',estado, @p_ver_version_id) Estado_Nombre
FROM         Seg_Rol


