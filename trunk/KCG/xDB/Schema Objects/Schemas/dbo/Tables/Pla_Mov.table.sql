CREATE TABLE [dbo].[Pla_Mov] (
    [Id]         INT             IDENTITY (1, 1) NOT NULL,
    [Codigo]     VARCHAR (200)   NOT NULL,
    [Pla_Poa_Id] INT             NOT NULL,
    [Pla_Doc_Id] INT             NOT NULL,
    [Orden]      INT             NOT NULL,
    [Valor]      NUMERIC (17, 4) NOT NULL,
    [Estado]     CHAR (3)        NOT NULL,
    [Tipo]       CHAR (3)        NOT NULL
);

