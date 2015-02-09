CREATE TABLE [dbo].[Int_Empresa] (
    [Id]          VARCHAR (17)   NOT NULL,
    [Codigo]      VARCHAR (200)  NOT NULL,
    [Abreviatura] VARCHAR (50)   NULL,
    [Nombre]      VARCHAR (500)  NOT NULL,
    [Imagen]      VARCHAR (2000) NULL,
    [Descripcion] VARCHAR (2000) NULL,
    [Estado]      CHAR (3)       NULL,
    [Plan_Cuenta] VARCHAR (3)    NULL,
    [Direccion]   VARCHAR (2000) NULL
);

