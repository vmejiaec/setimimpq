CREATE TABLE [dbo].[Fis_Planilla_Det] (
    [Id]                      VARCHAR (17)    NOT NULL,
    [Codigo]                  VARCHAR (200)   NOT NULL,
    [Estado]                  CHAR (3)        NULL,
    [Descripcion]             VARCHAR (2000)  NULL,
    [Apu_Prespuesto_Rubro_Id] VARCHAR (17)    NULL,
    [Apu_Rubro_Codigo]        VARCHAR (200)   NULL,
    [Apu_Rubro_Nombre]        VARCHAR (500)   NULL,
    [Apu_Rubro_Unidad]        VARCHAR (500)   NOT NULL,
    [Costo]                   NUMERIC (17, 4) NOT NULL,
    [Cantidad]                NUMERIC (17, 2) NOT NULL,
    [Fis_Planilla_Id]         VARCHAR (17)    NULL
);

