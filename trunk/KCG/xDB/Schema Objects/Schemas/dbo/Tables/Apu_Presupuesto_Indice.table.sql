CREATE TABLE [dbo].[Apu_Presupuesto_Indice] (
    [Id]                VARCHAR (17)    NOT NULL,
    [Codigo]            VARCHAR (200)   NOT NULL,
    [Estado]            CHAR (3)        NULL,
    [Descripcion]       VARCHAR (2000)  NULL,
    [Apu_Origen_Id]     VARCHAR (17)    NULL,
    [Apu_Insumo_Id]     VARCHAR (17)    NULL,
    [Apu_Indice_Id]     VARCHAR (17)    NULL,
    [Apu_Indice_Codigo] VARCHAR (200)   NULL,
    [Apu_Indice_Nombre] VARCHAR (500)   NULL,
    [Porcentaje]        NUMERIC (5, 2)  NOT NULL,
    [Costo_Total]       NUMERIC (17, 4) NOT NULL,
    [Costo_Indice]      NUMERIC (17, 4) NOT NULL
);

