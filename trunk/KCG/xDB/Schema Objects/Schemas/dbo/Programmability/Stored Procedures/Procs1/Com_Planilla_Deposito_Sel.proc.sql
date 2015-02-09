CREATE PROCEDURE [dbo].Com_Planilla_Deposito_Sel
AS
	SET NOCOUNT ON;
SELECT        Id, Fis_Planilla_Id, Codigo_Deposito, Fecha_Deposito, Comprobante_Ctbl, Valor, Valor_Interes, Descripcion
FROM            Com_Planilla_Deposito