CREATE PROCEDURE dbo.Com_Contrato_Legal_SelById
  (
    @p_Id int
  )
AS
	SET NOCOUNT ON;
SELECT
  Id, 
  Com_Contrato_Id, 
  Com_Contrato_Tipo_Id,
  (SELECT cct.Nombre from Com_Contrato_Tipo cct WHERE cct.Id = Com_Contrato_Tipo_Id) Com_Contrato_Tipo_Nombre,
  URL_Contrato_Word, 
  URL_Contrato_Scan, 
  Desc_Alerta_1, 
  Desc_Alerta_2, 
  Desc_Alerta_3,
  Fecha_Firma_Contrato, 
  Fecha_Contrato
FROM Com_Contrato_Legal
WHERE Id = @p_Id
