CREATE TABLE [dbo].[Per_Personal] (
    [Id]                  VARCHAR (17)  NOT NULL,
    [Codigo]              VARCHAR (200) NOT NULL,
    [Coordinador]         VARCHAR (3)   NOT NULL,
    [Tecnico_Costos]      VARCHAR (3)   NOT NULL,
    [Int_Empresa_Id]      VARCHAR (17)  NOT NULL,
    [Jefe_Costos]         VARCHAR (3)   NULL,
    [Estado]              CHAR (3)      NULL,
    [Par_Razon_Social_Id] VARCHAR (17)  NOT NULL,
    [Tipo_Fiscalizacion]  CHAR (3)      NOT NULL,
    [Jefe_Fiscalizacion]  VARCHAR (3)   NOT NULL,
    [Fiscalizacion]       VARCHAR (3)   NOT NULL,
    [Contratista]         VARCHAR (3)   NOT NULL
);

