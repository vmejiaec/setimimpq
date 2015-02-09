CREATE PROCEDURE [dbo].Com_Planilla_Pago_Del
(
	@Original_Id int,
	@Original_Fis_Planilla_Id varchar(17),
	@Original_Fecha_Pago smalldatetime,
	@Original_Comprobante_Pago varchar(200),
	@Original_Factura_Memo_Pago varchar(200),
	@Original_Valor_Cta_X_Cobrar numeric(17, 4),
	@Original_Fecha_Pago_Confirmada smalldatetime
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Com_Planilla_Pago] WHERE (([Id] = @Original_Id) AND ([Fis_Planilla_Id] = @Original_Fis_Planilla_Id) AND ([Fecha_Pago] = @Original_Fecha_Pago) AND ([Comprobante_Pago] = @Original_Comprobante_Pago) AND ([Factura_Memo_Pago] = @Original_Factura_Memo_Pago) AND ([Valor_Cta_X_Cobrar] = @Original_Valor_Cta_X_Cobrar) AND ([Fecha_Pago_Confirmada] = @Original_Fecha_Pago_Confirmada))