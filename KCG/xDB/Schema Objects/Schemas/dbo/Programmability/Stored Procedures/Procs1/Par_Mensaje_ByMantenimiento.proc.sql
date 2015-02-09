CREATE PROCEDURE [dbo].[Par_Mensaje_ByMantenimiento]
(
  @p_ver_version_id varchar (17)
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
   dbo.Estado ('PAR_MENSAJE','ESTADO',estado, @p_ver_version_id) Estado_Nombre
FROM   Par_Mensaje
WHERE  Id NOT IN 
(Select par_mensaje_id
 from ver_mensaje)
or   (Select count(*) 
       from Ver_mensaje 
       where par_mensaje.id = ver_mensaje.par_mensaje_id) 
       < (SELECT COUNT(*) FROM VER_VERSION)



