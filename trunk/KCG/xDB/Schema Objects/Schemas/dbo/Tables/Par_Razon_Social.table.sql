CREATE TABLE [dbo].[Par_Razon_Social] (
    [Id]                         VARCHAR (17)  NOT NULL,
    [Codigo]                     VARCHAR (200) NOT NULL,
    [Par_Tipo_Identificacion_Id] VARCHAR (17)  NOT NULL,
    [Numero]                     VARCHAR (200) NOT NULL,
    [Nombre]                     VARCHAR (500) NOT NULL,
    [Nombre_Comercial]           VARCHAR (500) NOT NULL,
    [Int_Empresa_Id]             VARCHAR (17)  NOT NULL,
    [Estado]                     CHAR (3)      NULL
);

