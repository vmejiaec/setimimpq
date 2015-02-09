CREATE PROCEDURE [dbo].[Par_Mensaje_Select]
(
  @p_Ver_Version_Id varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT     
   Id, 
   Codigo,
   Codigo_Mensaje, 
   Nombre, 
   Tipo, 
   Estado,
   dbo.Dominio ('PAR_MENSAJE','TIPO', tipo, @p_ver_version_id) Tipo_Nombre,
   dbo.Estado ('PAR_MENSAJE','ESTADO',estado, @p_ver_version_id) Estado_Nombre,
   dbo._Ver_Mensaje_Nombre(@p_ver_version_id,id) Ver_etiqueta_nombre,
   dbo._Ver_Mensaje_Nombre(@p_ver_version_id,id) Tool_Ver_etiqueta_nombre
FROM         Par_Mensaje





