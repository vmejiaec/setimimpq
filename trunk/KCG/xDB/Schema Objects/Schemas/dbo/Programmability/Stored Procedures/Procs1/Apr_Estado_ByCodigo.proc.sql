CREATE PROCEDURE [dbo].[Apr_Estado_ByCodigo]
(
  @p_Ver_Version_Id varchar(17),
  @p_Codigo varchar(200)
)
AS
	SET NOCOUNT ON;
SELECT     
  Id, 
  Codigo, 
  Nombre, 
  Dominio, 
  Estado, 
  Descripcion,
  dbo.Estado ('APR_ESTADO', 'ESTADO', estado, @p_ver_version_id ) Estado_Nombre
FROM         Apr_Estado
where Codigo=@p_Codigo




