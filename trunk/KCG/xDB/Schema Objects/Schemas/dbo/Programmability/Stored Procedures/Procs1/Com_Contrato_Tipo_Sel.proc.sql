CREATE PROCEDURE dbo.Com_Contrato_Tipo_Sel
AS
	SET NOCOUNT ON;
select 
  Id, 
  Nombre, 
  URL_Plantilla_Word 
from Com_Contrato_Tipo
