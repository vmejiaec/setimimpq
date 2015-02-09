CREATE TABLE [dbo].[zTMP] (
    [Id]      INT             IDENTITY (1, 1) NOT NULL,
    [Codigo]  VARCHAR (50)    NOT NULL,
    [Nombre]  VARCHAR (50)    NOT NULL,
    [Descrip] VARCHAR (50)    NULL,
    [Fecha]   SMALLDATETIME   NOT NULL,
    [Valor]   NUMERIC (17, 4) NOT NULL,
    [Estado]  CHAR (3)        NOT NULL
);

