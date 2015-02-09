CREATE TABLE [dbo].[Int_Moneda] (
    [Id]            VARCHAR (17)   NOT NULL,
    [Codigo]        VARCHAR (200)  NOT NULL,
    [Nombre]        VARCHAR (500)  NOT NULL,
    [Abreviatura]   VARCHAR (50)   NULL,
    [Moneda_Id_Ref] VARCHAR (200)  NOT NULL,
    [Simbolo]       VARCHAR (5)    NOT NULL,
    [Descripcion]   VARCHAR (2000) NULL,
    [Estado]        CHAR (3)       NULL
);

