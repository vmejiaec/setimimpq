CREATE PROCEDURE [dbo].Com_Planilla_Pago_Ins
(
	@Fis_Planilla_Id varchar(17),
	@Fecha_Pago smalldatetime,
	@Comprobante_Pago varchar(200),
	@Factura_Memo_Pago varchar(200),
	@Valor_Cta_X_Cobrar numeric(17, 4),
	@Fecha_Pago_Confirmada smalldatetime
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Com_Planilla_Pago] ([Fis_Planilla_Id], [Fecha_Pago], [Comprobante_Pago], [Factura_Memo_Pago], [Valor_Cta_X_Cobrar], [Fecha_Pago_Confirmada]) VALUES (@Fis_Planilla_Id, @Fecha_Pago, @Comprobante_Pago, @Factura_Memo_Pago, @Valor_Cta_X_Cobrar, @Fecha_Pago_Confirmada);
	
SELECT Id, Fis_Planilla_Id, Fecha_Pago, Comprobante_Pago, Factura_Memo_Pago, Valor_Cta_X_Cobrar, Fecha_Pago_Confirmada FROM Com_Planilla_Pago WHERE (Id = SCOPE_IDENTITY())