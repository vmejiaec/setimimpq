CREATE PROCEDURE [dbo].[Par_Servidor_ById]
(
   @p_Ver_Version_id varchar (17),
   @p_Id varchar(17)
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
where Id=@p_Id


