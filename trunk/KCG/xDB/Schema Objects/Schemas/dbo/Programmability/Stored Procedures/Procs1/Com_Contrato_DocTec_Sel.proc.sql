CREATE PROCEDURE [dbo].Com_Contrato_DocTec_Sel
AS
	SET NOCOUNT ON;
SELECT        Id, Com_Contrato_Id, Nombre, Tiene
FROM            Com_Contrato_DocTec