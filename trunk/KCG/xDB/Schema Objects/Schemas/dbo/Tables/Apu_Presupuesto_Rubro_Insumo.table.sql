CREATE TABLE [dbo].[Apu_Presupuesto_Rubro_Insumo] (
    [Id]                   VARCHAR (17)    NOT NULL,
    [Codigo]               VARCHAR (200)   NOT NULL,
    [Estado]               CHAR (3)        NULL,
    [Descripcion]          VARCHAR (2000)  NULL,
    [Origen]               CHAR (3)        NOT NULL,
    [Apu_Origen_Id]        VARCHAR (17)    NOT NULL,
    [Apu_Rubro_Id]         VARCHAR (17)    NOT NULL,
    [Apu_Rubro_Codigo]     VARCHAR (200)   NOT NULL,
    [Apu_Rubro_Nombre]     VARCHAR (500)   NOT NULL,
    [Apu_Rubro_Cantidad]   NUMERIC (17, 2) NOT NULL,
    [Apu_Rubro_Unidad]     VARCHAR (200)   NOT NULL,
    [Insumo]               CHAR (3)        NOT NULL,
    [Apu_Insumo_Id]        VARCHAR (17)    NOT NULL,
    [Apu_Insumo_Codigo]    VARCHAR (200)   NOT NULL,
    [Apu_Insumo_Nombre]    VARCHAR (500)   NOT NULL,
    [Apu_Categoria_Id]     VARCHAR (17)    NULL,
    [Apu_Categoria_Codigo] VARCHAR (200)   NULL,
    [Apu_Categoria_Nombre] VARCHAR (500)   NULL,
    [Costo_Diario]         NUMERIC (17, 4) NOT NULL,
    [Rendimiento]          NUMERIC (17, 4) NOT NULL,
    [Cantidad]             NUMERIC (17, 4) NOT NULL
);

