CREATE TABLE [dbo].[Com_Planilla_Deposito] (
    [Id]               INT             IDENTITY (1, 1) NOT NULL,
    [Fis_Planilla_Id]  VARCHAR (17)    NOT NULL,
    [Codigo_Deposito]  VARCHAR (200)   NOT NULL,
    [Fecha_Deposito]   SMALLDATETIME   NOT NULL,
    [Comprobante_Ctbl] VARCHAR (200)   NOT NULL,
    [Valor]            NUMERIC (17, 4) NOT NULL,
    [Valor_Interes]    NUMERIC (17, 4) NOT NULL,
    [Descripcion]      VARCHAR (300)   NOT NULL
);

