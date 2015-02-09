CREATE PROCEDURE dbo.Com_Contrato_Tipo_SelById
  (
    @p_Id int
  )
AS
	SET NOCOUNT ON;
select 
  Id, 
  Nombre, 
  URL_Plantilla_Word 
from Com_Contrato_Tipo
WHERE Id = @p_Id