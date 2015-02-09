CREATE TABLE [dbo].[Fis_Planilla_Multa] (
    [Id]              VARCHAR (17)    NOT NULL,
    [Codigo]          VARCHAR (200)   NOT NULL,
    [Fis_Planilla_Id] VARCHAR (17)    NOT NULL,
    [Fis_Multa_Id]    VARCHAR (17)    NOT NULL,
    [Valor]           NUMERIC (17, 2) NOT NULL,
    [Fecha]           SMALLDATETIME   NOT NULL,
    [Estado]          CHAR (3)        NULL,
    [Descripcion]     VARCHAR (2000)  NULL
);

