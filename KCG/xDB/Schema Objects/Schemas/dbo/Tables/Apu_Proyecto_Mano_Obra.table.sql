CREATE TABLE [dbo].[Apu_Proyecto_Mano_Obra] (
    [Id]               VARCHAR (17)    NOT NULL,
    [Codigo]           VARCHAR (200)   NOT NULL,
    [Costo_Diario]     NUMERIC (17, 4) NOT NULL,
    [Apu_Proyecto_Id]  VARCHAR (17)    NOT NULL,
    [Apu_Mano_Obra_Id] VARCHAR (17)    NOT NULL,
    [Apu_Indice_Id]    VARCHAR (17)    NULL,
    [Apu_Categoria_Id] VARCHAR (17)    NULL,
    [Estado]           CHAR (3)        NULL
);

