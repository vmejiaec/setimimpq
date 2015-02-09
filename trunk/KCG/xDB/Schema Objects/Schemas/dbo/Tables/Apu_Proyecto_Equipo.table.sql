CREATE TABLE [dbo].[Apu_Proyecto_Equipo] (
    [Id]                  VARCHAR (17)    NOT NULL,
    [Codigo]              VARCHAR (200)   NOT NULL,
    [Costo_Combustible]   NUMERIC (17, 4) NOT NULL,
    [Costo_Repuesto]      NUMERIC (17, 4) NOT NULL,
    [Costo_Mantenimiento] NUMERIC (17, 4) NOT NULL,
    [Costo_Alquiler]      NUMERIC (17, 4) NOT NULL,
    [Costo_Otros]         NUMERIC (17, 4) NOT NULL,
    [Apu_Proyecto_Id]     VARCHAR (17)    NOT NULL,
    [Apu_Equipo_Id]       VARCHAR (17)    NOT NULL,
    [Estado]              CHAR (3)        NULL
);

