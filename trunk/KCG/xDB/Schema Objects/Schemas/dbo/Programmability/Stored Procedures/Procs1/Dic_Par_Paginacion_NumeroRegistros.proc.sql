CREATE PROCEDURE [dbo].[Dic_Par_Paginacion_NumeroRegistros]
(
  @p_dic_objeto_nombre  varchar(500)
)
AS
	SET NOCOUNT ON;

EXEC('SELECT count(*) FROM ' + @p_dic_objeto_nombre)




