CREATE TABLE [dbo].[Par_Tipo_Identificacion] (
    [Id]             VARCHAR (17)   NOT NULL,
    [Codigo]         VARCHAR (200)  NOT NULL,
    [Nombre]         VARCHAR (500)  NOT NULL,
    [Int_Empresa_Id] VARCHAR (17)   NOT NULL,
    [Descripcion]    VARCHAR (2000) NULL,
    [Estado]         CHAR (3)       NULL,
    [Cedula]         VARCHAR (3)    NULL
);

