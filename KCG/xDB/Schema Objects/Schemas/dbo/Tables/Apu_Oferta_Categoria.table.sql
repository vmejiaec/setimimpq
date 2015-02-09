CREATE TABLE [dbo].[Apu_Oferta_Categoria] (
    [Id]               VARCHAR (17)    NOT NULL,
    [Codigo]           VARCHAR (200)   NOT NULL,
    [Apu_Oferta_Id]    VARCHAR (17)    NOT NULL,
    [Apu_Categoria_Id] VARCHAR (17)    NOT NULL,
    [Costo_Diario]     NUMERIC (17, 4) NOT NULL,
    [Estado]           CHAR (3)        NULL
);

