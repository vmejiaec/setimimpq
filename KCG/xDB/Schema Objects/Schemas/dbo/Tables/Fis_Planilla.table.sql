CREATE TABLE [dbo].[Fis_Planilla] (
    [Id]                          VARCHAR (17)    NOT NULL,
    [Codigo]                      VARCHAR (200)   NOT NULL,
    [Estado]                      CHAR (3)        NULL,
    [Descripcion]                 VARCHAR (2000)  NULL,
    [Tipo_Planilla]               CHAR (3)        NOT NULL,
    [Apu_Presupuesto_Id]          VARCHAR (17)    NOT NULL,
    [Fecha_Inicio_Ingreso]        SMALLDATETIME   NOT NULL,
    [Fecha_Inicial]               SMALLDATETIME   NOT NULL,
    [Fecha_Final]                 SMALLDATETIME   NOT NULL,
    [Fecha_Ultimo_Ingreso]        SMALLDATETIME   NOT NULL,
    [Porcentaje_Iva]              NUMERIC (5, 2)  NOT NULL,
    [Porcentaje_Retencion]        NUMERIC (5, 2)  NOT NULL,
    [Fecha_Reajuste_Provisional]  SMALLDATETIME   NOT NULL,
    [Fecha_Reajuste_Definitivo]   SMALLDATETIME   NOT NULL,
    [Numero_Planilla]             VARCHAR (50)    NOT NULL,
    [Descripcion_Provisional]     VARCHAR (2000)  NULL,
    [Descripcion_Definitiva]      VARCHAR (2000)  NULL,
    [Anticipo_Devengar]           NUMERIC (17, 4) NOT NULL,
    [Provisional_Fis_Catalogo_Id] VARCHAR (17)    NULL,
    [Definitivo_Fis_Catalogo_Id]  VARCHAR (17)    NULL
);

