CREATE PROCEDURE [dbo].[Dic_Paginacion_NumeroSecciones]
(
  @p_par_servidor_id varchar(17),
  @p_dic_objeto_id varchar(17)
)
AS
	SET NOCOUNT ON;
SELECT count(*)
FROM  Dic_Paginacion
where par_servidor_id = @p_par_servidor_id
and   dic_objeto_id = @p_dic_objeto_id




