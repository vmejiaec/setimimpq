CREATE PROCEDURE [dbo].[Dic_Secuencia_BloquearId]
(
  @p_Id varchar(17)
)
AS
	SET NOCOUNT ON;
-- Se debe bloquear el registro que se envia como parametro.
SELECT Id    
FROM   Dic_Secuencia
where Id=@p_Id



