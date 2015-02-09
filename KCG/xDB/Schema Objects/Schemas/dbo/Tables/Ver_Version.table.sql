CREATE TABLE [dbo].[Ver_Version] (
    [Id]             VARCHAR (17)   NOT NULL,
    [Codigo]         VARCHAR (200)  NOT NULL,
    [Nombre]         VARCHAR (500)  NOT NULL,
    [Abreviatura]    VARCHAR (10)   NOT NULL,
    [Predeterminada] VARCHAR (3)    NOT NULL,
    [Ruta_Imagen]    VARCHAR (500)  NOT NULL,
    [Estado]         CHAR (3)       NULL,
    [Descripcion]    VARCHAR (2000) NULL
);

