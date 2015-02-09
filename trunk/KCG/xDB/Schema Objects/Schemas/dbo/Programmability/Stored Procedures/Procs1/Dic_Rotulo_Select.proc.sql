CREATE PROCEDURE [dbo].[Dic_Rotulo_Select]
(
  @p_Ver_Version_Id varchar(17)
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


