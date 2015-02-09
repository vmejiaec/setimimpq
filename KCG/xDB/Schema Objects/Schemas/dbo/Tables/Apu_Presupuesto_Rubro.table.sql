CREATE TABLE [dbo].[Apu_Presupuesto_Rubro] (
    [Id]                 VARCHAR (17)    NOT NULL,
    [Codigo]             VARCHAR (200)   NOT NULL,
    [Estado]             CHAR (3)        NULL,
    [Descripcion]        VARCHAR (2000)  NULL,
    [Apu_Presupuesto_Id] VARCHAR (17)    NOT NULL,
    [Apu_Rubro_id]       VARCHAR (17)    NOT NULL,
    [Apu_Rubro_Codigo]   VARCHAR (200)   NOT NULL,
    [Apu_Rubro_Nombre]   VARCHAR (500)   NOT NULL,
    [Apu_Rubro_Unidad]   VARCHAR (200)   NOT NULL,
    [Apu_Rubro_Cantidad] NUMERIC (17, 2) NOT NULL,
    [Costo_Unitario]     NUMERIC (17, 4) NOT NULL,
    [Costo_Total]        NUMERIC (17, 4) NOT NULL,
    [Apu_Subtitulo_Id]   VARCHAR (17)    NULL
);

