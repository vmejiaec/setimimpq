CREATE TABLE [dbo].[Apu_Proyecto_Rubro_Tecnica] (
    [Id]                    VARCHAR (17)   NOT NULL,
    [Codigo]                VARCHAR (200)  NOT NULL,
    [Apu_Proyecto_Rubro_Id] VARCHAR (17)   NOT NULL,
    [Imagen]                VARCHAR (500)  NULL,
    [Origen_Imagen]         VARCHAR (4000) NULL,
    [Definicion]            VARCHAR (4000) NULL,
    [Especificacion]        VARCHAR (4000) NULL,
    [Medicion]              VARCHAR (4000) NULL,
    [Estado]                CHAR (3)       NULL
);

