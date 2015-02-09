CREATE PROCEDURE [dbo].Com_Planilla_Pago_Sel
AS
	SET NOCOUNT ON;
SELECT        Id, Fis_Planilla_Id, Fecha_Pago, Comprobante_Pago, Factura_Memo_Pago, Valor_Cta_X_Cobrar, Fecha_Pago_Confirmada
FROM            Com_Planilla_Pago