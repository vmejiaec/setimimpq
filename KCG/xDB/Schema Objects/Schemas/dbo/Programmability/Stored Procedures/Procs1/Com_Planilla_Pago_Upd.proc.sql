CREATE PROCEDURE [dbo].Com_Planilla_Pago_Upd
(
	@Fis_Planilla_Id varchar(17),
	@Fecha_Pago smalldatetime,
	@Comprobante_Pago varchar(200),
	@Factura_Memo_Pago varchar(200),
	@Valor_Cta_X_Cobrar numeric(17, 4),
	@Fecha_Pago_Confirmada smalldatetime,
	@Original_Id int,
	@Original_Fis_Planilla_Id varchar(17),
	@Original_Fecha_Pago smalldatetime,
	@Original_Comprobante_Pago varchar(200),
	@Original_Factura_Memo_Pago varchar(200),
	@Original_Valor_Cta_X_Cobrar numeric(17, 4),
	@Original_Fecha_Pago_Confirmada smalldatetime,
	@Id int
)
AS
	SET NOCOUNT OFF;
UPDATE [Com_Planilla_Pago] SET [Fis_Planilla_Id] = @Fis_Planilla_Id, [Fecha_Pago] = @Fecha_Pago, [Comprobante_Pago] = @Comprobante_Pago, [Factura_Memo_Pago] = @Factura_Memo_Pago, [Valor_Cta_X_Cobrar] = @Valor_Cta_X_Cobrar, [Fecha_Pago_Confirmada] = @Fecha_Pago_Confirmada WHERE (([Id] = @Original_Id) AND ([Fis_Planilla_Id] = @Original_Fis_Planilla_Id) AND ([Fecha_Pago] = @Original_Fecha_Pago) AND ([Comprobante_Pago] = @Original_Comprobante_Pago) AND ([Factura_Memo_Pago] = @Original_Factura_Memo_Pago) AND ([Valor_Cta_X_Cobrar] = @Original_Valor_Cta_X_Cobrar) AND ([Fecha_Pago_Confirmada] = @Original_Fecha_Pago_Confirmada));
	
SELECT Id, Fis_Planilla_Id, Fecha_Pago, Comprobante_Pago, Factura_Memo_Pago, Valor_Cta_X_Cobrar, Fecha_Pago_Confirmada FROM Com_Planilla_Pago WHERE (Id = @Id)