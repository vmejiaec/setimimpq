CREATE TABLE [dbo].[Apu_Presupuesto_Cuadrilla] (
    [Id]                  VARCHAR (17)    NOT NULL,
    [Codigo]              VARCHAR (200)   NOT NULL,
    [Estado]              CHAR (3)        NULL,
    [Apu_Presupuesto_Id]  VARCHAR (17)    NOT NULL,
    [Origen]              VARCHAR (3)     NOT NULL,
    [Origen_Id]           VARCHAR (17)    NOT NULL,
    [Origen_Codigo]       VARCHAR (200)   NOT NULL,
    [Origen_Nombre]       VARCHAR (500)   NOT NULL,
    [Costo_Total]         NUMERIC (17, 4) NOT NULL,
    [Salario_Real]        NUMERIC (17, 4) NOT NULL,
    [Numero_Trabajadores] NUMERIC (17, 4) NOT NULL,
    [Coeficiente]         NUMERIC (17, 4) NOT NULL,
    [Costo_Actual]        NUMERIC (17, 4) NOT NULL
);

