CREATE TABLE [dbo].[Fis_Catalogo_Indice] (
    [Id]              VARCHAR (17)    NOT NULL,
    [Codigo]          VARCHAR (200)   NOT NULL,
    [Estado]          CHAR (3)        NULL,
    [Descripcion]     VARCHAR (2000)  NULL,
    [Fis_Catalogo_Id] VARCHAR (17)    NOT NULL,
    [Apu_Indice_Id]   VARCHAR (17)    NOT NULL,
    [Valor]           NUMERIC (17, 3) NOT NULL
);

