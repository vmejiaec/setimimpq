CREATE PROCEDURE [dbo].[Seg_Rol_ByCodigo]
(
   @p_Ver_Version_Id varchar (17),
   @p_Codigo varchar(200)
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
where Codigo=@p_Codigo

