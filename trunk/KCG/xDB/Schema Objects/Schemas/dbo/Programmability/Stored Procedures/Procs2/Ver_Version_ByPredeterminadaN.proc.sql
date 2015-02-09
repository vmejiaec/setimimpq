
CREATE PROCEDURE [dbo].[Ver_Version_ByPredeterminadaN]
(
  @p_ver_version_id varchar(17)
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
where predeterminada = 'N'









