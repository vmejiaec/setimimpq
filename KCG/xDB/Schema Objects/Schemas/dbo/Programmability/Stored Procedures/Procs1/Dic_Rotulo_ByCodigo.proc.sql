CREATE PROCEDURE [dbo].[Dic_Rotulo_ByCodigo]
(
  @p_Ver_Version_Id varchar(17),
  @p_Codigo varchar(200)
)
AS
	SET NOCOUNT ON;
SELECT     
   Id, 
   Codigo, 
   Estado, 
   Nombre,
   dbo.Estado ('DIC_ROTULO','ESTADO',Estado, @p_ver_version_id) Estado_nombre
FROM         Dic_Rotulo
where Codigo=@p_Codigo

