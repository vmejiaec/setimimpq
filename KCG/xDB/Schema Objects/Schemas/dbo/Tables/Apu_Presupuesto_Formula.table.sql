CREATE TABLE [dbo].[Apu_Presupuesto_Formula] (
    [Id]                 VARCHAR (17)    NOT NULL,
    [Codigo]             VARCHAR (200)   NOT NULL,
    [Estado]             CHAR (3)        NULL,
    [Apu_Presupuesto_Id] VARCHAR (17)    NOT NULL,
    [Apu_Indice_Id]      VARCHAR (17)    NOT NULL,
    [Apu_Indice_Codigo]  VARCHAR (200)   NOT NULL,
    [Apu_Indice_Nombre]  VARCHAR (500)   NOT NULL,
    [Costo_Total]        NUMERIC (17, 4) NOT NULL,
    [Coeficiente]        NUMERIC (17, 4) NOT NULL,
    [Letra]              VARCHAR (1)     NULL,
    [Costo_Actual]       NUMERIC (17, 4) NOT NULL
);

