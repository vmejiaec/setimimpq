CREATE TABLE [dbo].[Int_Sucursal] (
    [Id]             VARCHAR (17)   NOT NULL,
    [Codigo]         VARCHAR (200)  NOT NULL,
    [Nombre]         VARCHAR (500)  NOT NULL,
    [Abreviatura]    VARCHAR (50)   NULL,
    [Numero]         INT            NOT NULL,
    [Predeterminada] VARCHAR (3)    NOT NULL,
    [Int_Empresa_Id] VARCHAR (17)   NOT NULL,
    [Int_Moneda_Id]  VARCHAR (17)   NOT NULL,
    [Estado]         CHAR (3)       NULL,
    [Descripcion]    VARCHAR (2000) NULL
);

