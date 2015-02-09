create PROCEDURE [dbo].[Com_Contrato_DocTec_SelById]
(
	@p_Id int
)
AS
	SET NOCOUNT ON;
SELECT        Id, Com_Contrato_Id, Nombre, Tiene
FROM            Com_Contrato_DocTec
where Id = @p_Id