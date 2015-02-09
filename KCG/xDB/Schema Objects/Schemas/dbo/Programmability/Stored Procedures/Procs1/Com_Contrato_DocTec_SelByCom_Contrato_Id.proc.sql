create PROCEDURE [dbo].[Com_Contrato_DocTec_SelByCom_Contrato_Id]
(
	@p_Com_Contrato_Id int
)
AS
	SET NOCOUNT ON;
SELECT        Id, Com_Contrato_Id, Nombre, Tiene
FROM            Com_Contrato_DocTec
where Com_Contrato_Id = @p_Com_Contrato_Id