CREATE PROCEDURE [dbo].[Ver_Version_Select]
(  
   @p_Ver_Version_Id varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT     
   Id, 
   Codigo, 
   Nombre, 
   Abreviatura,
   Predeterminada, 
   Ruta_Imagen, 
   Estado, 
   Descripcion,
   dbo.Dominio ('VER_VERSION','PREDETERMINADA',predeterminada, @p_ver_version_id) Predeterminada_Nombre,
   dbo.Estado ('VER_VERSION','ESTADO',estado, @p_ver_version_id) Estado_Nombre
FROM         Ver_Version





