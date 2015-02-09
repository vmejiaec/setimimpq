CREATE TABLE [dbo].[Fis_Catalogo_Categoria] (
    [Id]               VARCHAR (17)    NOT NULL,
    [Codigo]           VARCHAR (200)   NOT NULL,
    [Fis_Catalogo_Id]  VARCHAR (17)    NOT NULL,
    [Apu_Categoria_Id] VARCHAR (17)    NOT NULL,
    [Valor]            NUMERIC (17, 4) NOT NULL,
    [Estado]           CHAR (3)        NULL,
    [Descripcion]      VARCHAR (2000)  NULL
);

