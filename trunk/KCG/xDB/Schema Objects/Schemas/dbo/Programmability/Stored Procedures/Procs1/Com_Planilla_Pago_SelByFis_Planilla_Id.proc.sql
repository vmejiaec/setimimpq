
Create PROCEDURE [dbo].[Com_Planilla_Pago_SelByFis_Planilla_Id]
(
	@p_Fis_Planilla_Id varchar(17)
)
AS
	SET NOCOUNT ON;
SELECT        Id, Fis_Planilla_Id, Fecha_Pago, Comprobante_Pago, Factura_Memo_Pago, Valor_Cta_X_Cobrar, Fecha_Pago_Confirmada
FROM            Com_Planilla_Pago
where Fis_Planilla_Id = @p_Fis_Planilla_Id