CREATE PROCEDURE [dbo].[Apr_Estado_ById]
(
  @p_Ver_Version_Id varchar(17),
  @p_Id varchar(17)
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
where Id=@p_Id 




