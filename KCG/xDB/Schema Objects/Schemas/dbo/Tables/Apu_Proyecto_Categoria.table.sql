CREATE TABLE [dbo].[Apu_Proyecto_Categoria] (
    [Id]               VARCHAR (17)    NOT NULL,
    [Codigo]           VARCHAR (200)   NOT NULL,
    [Apu_Proyecto_Id]  VARCHAR (17)    NOT NULL,
    [Apu_Categoria_Id] VARCHAR (17)    NOT NULL,
    [Costo_Diario]     NUMERIC (17, 4) NOT NULL,
    [Estado]           CHAR (3)        NULL
);

