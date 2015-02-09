CREATE TABLE [dbo].[Ver_Etiqueta] (
    [Id]               VARCHAR (17)  NOT NULL,
    [Codigo]           VARCHAR (200) NOT NULL,
    [Nombre]           VARCHAR (500) NOT NULL,
    [Ver_Version_Id]   VARCHAR (17)  NOT NULL,
    [Dic_Rotulo_Id]    VARCHAR (17)  NOT NULL,
    [Imagen_Activa]    VARCHAR (500) NULL,
    [Imagen_Desactiva] VARCHAR (500) NULL,
    [Estado]           CHAR (3)      NULL
);

