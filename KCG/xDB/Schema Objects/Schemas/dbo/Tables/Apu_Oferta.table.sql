CREATE TABLE [dbo].[Apu_Oferta] (
    [Id]                         VARCHAR (17)    NOT NULL,
    [Codigo]                     VARCHAR (200)   NOT NULL,
    [Nombre]                     VARCHAR (500)   NOT NULL,
    [Apu_Lugar_Id]               VARCHAR (17)    NOT NULL,
    [Area]                       NUMERIC (17, 4) NULL,
    [Porcentaje_Costo_Indirecto] NUMERIC (5, 2)  NOT NULL,
    [Porcentaje_Costo_Otros]     NUMERIC (5, 2)  NOT NULL,
    [Fecha_Creacion]             SMALLDATETIME   NOT NULL,
    [Creacion_Per_Personal_Id]   VARCHAR (17)    NOT NULL,
    [Fecha_Update]               SMALLDATETIME   NULL,
    [Update_Per_Personal_Id]     VARCHAR (17)    NULL,
    [Contratista]                VARCHAR (500)   NULL,
    [Tecnico_Per_Personal_Id]    VARCHAR (17)    NOT NULL,
    [Etapa]                      CHAR (3)        NOT NULL,
    [Int_Sucursal_Id]            VARCHAR (17)    NOT NULL,
    [Int_Moneda_Id]              VARCHAR (17)    NOT NULL,
    [Estado]                     CHAR (3)        NULL,
    [Descripcion]                VARCHAR (2000)  NULL,
    [Codigo_Institucion]         VARCHAR (200)   NULL,
    [Tipo_Contrato]              CHAR (3)        NOT NULL
);

