CREATE PROCEDURE [dbo].[Dic_Paginacion_DeleteServidorObjeto]
(
  @p_Par_Servidor_Id varchar(17),
  @p_dic_objeto_Id varchar(17) 
)
AS
	SET NOCOUNT ON;
SET NOCOUNT OFF;

DELETE 
FROM [Dic_Paginacion] 
WHERE [Par_Servidor_Id] = @p_Par_Servidor_Id AND 
      [Dic_Objeto_Id]   = @p_Dic_Objeto_Id


select count(*)
FROM [Dic_Paginacion] 
WHERE [Par_Servidor_Id] = @p_Par_Servidor_Id AND 
      [Dic_Objeto_Id]   = @p_Dic_Objeto_Id






