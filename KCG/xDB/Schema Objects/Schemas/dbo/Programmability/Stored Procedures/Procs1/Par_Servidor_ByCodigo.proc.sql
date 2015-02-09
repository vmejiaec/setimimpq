CREATE PROCEDURE [dbo].[Par_Servidor_ByCodigo]
(
   @p_Ver_Version_id varchar (17),
   @p_Codigo varchar(200)
)
AS
	SET NOCOUNT ON;
SELECT     
   Id, 
   Codigo,
   Nombre,
   Descripcion, 
   Ruta,
   Estado, 
   dbo.Estado ('PAR_SERVIDOR','ESTADO',estado, @p_ver_version_id) estado_nombre
FROM         Par_Servidor
where Codigo=@p_Codigo


