CREATE TABLE [dbo].[Apu_Categoria] (
    [Id]             VARCHAR (17)    NOT NULL,
    [Codigo]         VARCHAR (200)   NOT NULL,
    [Nombre]         VARCHAR (500)   NOT NULL,
    [Int_Empresa_Id] VARCHAR (17)    NOT NULL,
    [Costo_Diario]   NUMERIC (17, 4) NOT NULL,
    [Estado]         CHAR (3)        NULL
);

