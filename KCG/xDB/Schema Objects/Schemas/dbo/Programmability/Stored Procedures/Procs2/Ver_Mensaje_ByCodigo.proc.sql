CREATE  PROCEDURE [dbo].[Ver_Mensaje_ByCodigo]
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
   Ver_Version_Id, 
   Par_Mensaje_Id, 
   Estado,

   dbo._Ver_Version_Codigo (ver_version_id) ver_version_codigo,
   dbo._Ver_Version_Nombre (ver_version_id) ver_version_nombre,

   dbo._Par_Mensaje_Codigo         (par_mensaje_id) par_mensaje_codigo,
   dbo._Par_Mensaje_Nombre         (par_mensaje_id) par_mensaje_nombre,
   dbo._Par_Mensaje_Codigo_Mensaje (par_mensaje_id) par_mensaje_codigo_mensaje,
   dbo.Estado ('VER_MENSAJE',ESTADO, estado, @p_ver_version_id) Estado_nombre
FROM         Ver_Mensaje
where Codigo=@p_Codigo AND Ver_Version_id=@p_Ver_Version_Id



