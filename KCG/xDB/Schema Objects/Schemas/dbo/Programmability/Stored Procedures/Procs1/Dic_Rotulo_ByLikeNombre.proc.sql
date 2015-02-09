CREATE PROCEDURE [dbo].[Dic_Rotulo_ByLikeNombre]
(
	@p_Ver_Version_Id varchar(17),
	@p_Nombre varchar(500)
)
AS
	SET NOCOUNT ON;
SELECT     
   Id, 
   Codigo, 
   Estado, 
   Nombre,
   dbo.Estado ('DIC_ROTULO','ESTADO',Estado, @p_ver_version_id) Estado_nombre

FROM Dic_Rotulo
WHERE Nombre like @p_Nombre