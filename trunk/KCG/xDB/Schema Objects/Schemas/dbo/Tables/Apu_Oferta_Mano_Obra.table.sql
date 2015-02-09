CREATE TABLE [dbo].[Apu_Oferta_Mano_Obra] (
    [Id]               VARCHAR (17)    NOT NULL,
    [Codigo]           VARCHAR (200)   NOT NULL,
    [Apu_Oferta_Id]    VARCHAR (17)    NOT NULL,
    [Apu_Mano_Obra_Id] VARCHAR (17)    NOT NULL,
    [Apu_Categoria_Id] VARCHAR (17)    NULL,
    [Apu_Indice_Id]    VARCHAR (17)    NOT NULL,
    [Estado]           CHAR (3)        NULL,
    [Costo_Diario]     NUMERIC (17, 4) NOT NULL
);

