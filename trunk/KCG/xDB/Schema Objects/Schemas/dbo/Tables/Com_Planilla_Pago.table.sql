CREATE TABLE [dbo].[Com_Planilla_Pago] (
    [Id]                    INT             IDENTITY (1, 1) NOT NULL,
    [Fis_Planilla_Id]       VARCHAR (17)    NOT NULL,
    [Fecha_Pago]            SMALLDATETIME   NOT NULL,
    [Comprobante_Pago]      VARCHAR (200)   NOT NULL,
    [Factura_Memo_Pago]     VARCHAR (200)   NOT NULL,
    [Valor_Cta_X_Cobrar]    NUMERIC (17, 4) NOT NULL,
    [Fecha_Pago_Confirmada] SMALLDATETIME   NOT NULL
);

