CREATE PROCEDURE dbo.Com_Contrato_Tipo_Marca_DelByCom_Contrato_Tipo_Id
(
	@p_Com_Contrato_Tipo_Id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Com_Contrato_Tipo_Marca] 
  WHERE Com_Contrato_Tipo_Id = @p_Com_Contrato_Tipo_Id

SELECT 1

