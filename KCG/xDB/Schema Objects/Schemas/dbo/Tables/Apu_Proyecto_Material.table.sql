CREATE TABLE [dbo].[Apu_Proyecto_Material] (
    [Id]               VARCHAR (17)    NOT NULL,
    [Codigo]           VARCHAR (200)   NOT NULL,
    [Apu_Material_Id]  VARCHAR (17)    NOT NULL,
    [Apu_Proyecto_Id]  VARCHAR (17)    NOT NULL,
    [Costo_Parcial]    NUMERIC (17, 4) NOT NULL,
    [Costo_Otros]      NUMERIC (17, 4) NOT NULL,
    [Costo_Transporte] NUMERIC (17, 4) NOT NULL,
    [Apu_Indice_Id]    VARCHAR (17)    NULL,
    [Estado]           CHAR (3)        NULL
);

