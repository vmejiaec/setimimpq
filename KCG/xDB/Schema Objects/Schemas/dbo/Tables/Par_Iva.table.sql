CREATE TABLE [dbo].[Par_Iva] (
    [Id]                       VARCHAR (17)   NOT NULL,
    [Codigo]                   VARCHAR (200)  NOT NULL,
    [Nombre]                   VARCHAR (500)  NOT NULL,
    [Valor]                    NUMERIC (5, 2) NOT NULL,
    [Cuenta]                   VARCHAR (200)  NULL,
    [Tipo_Auxiliar]            VARCHAR (3)    NULL,
    [Auxiliar]                 VARCHAR (200)  NULL,
    [Int_Empresa_Id]           VARCHAR (17)   NOT NULL,
    [Creacion_Per_Personal_Id] VARCHAR (17)   NOT NULL,
    [Fecha_Creacion]           SMALLDATETIME  NOT NULL,
    [Update_Per_Personal_Id]   VARCHAR (17)   NOT NULL,
    [Fecha_Update]             SMALLDATETIME  NOT NULL,
    [Descripcion]              VARCHAR (2000) NULL,
    [Estado]                   CHAR (3)       NULL
);

