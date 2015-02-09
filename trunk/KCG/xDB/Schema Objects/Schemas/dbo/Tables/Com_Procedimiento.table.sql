CREATE TABLE [dbo].[Com_Procedimiento] (
    [Id]        INT             IDENTITY (1, 1) NOT NULL,
    [Nombre]    VARCHAR (500)   NOT NULL,
    [Tipo]      CHAR (3)        NOT NULL,
    [Valor_Min] NUMERIC (17, 2) NOT NULL,
    [Valor_Max] NUMERIC (17, 2) NOT NULL,
    [Iniciales] VARCHAR (50)    NULL
);

