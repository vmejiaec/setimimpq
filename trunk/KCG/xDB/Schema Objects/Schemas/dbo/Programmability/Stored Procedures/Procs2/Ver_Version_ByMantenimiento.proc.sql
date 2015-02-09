CREATE PROCEDURE [dbo].[Ver_Version_ByMantenimiento]
(  
   @p_ver_version_id varchar (17)
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
where 
   id not in (select ver_version_id from ver_documento)
or id not in (select ver_version_id from ver_doc_estado)
or id not in (select ver_version_id from ver_dominio)
or id not in (select ver_version_id from ver_etiqueta)
or id not in (select ver_version_id from ver_mensaje)






