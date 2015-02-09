CREATE TABLE [dbo].[Dic_Contenedor] (
    [Id]            VARCHAR (17)  NOT NULL,
    [Codigo]        VARCHAR (200) NOT NULL,
    [Nombre]        VARCHAR (500) NOT NULL,
    [Estado]        CHAR (3)      NULL,
    [Tipo]          CHAR (3)      NOT NULL,
    [Dic_Modulo_id] VARCHAR (17)  NOT NULL,
    [Filtro]        VARCHAR (3)   NOT NULL
);

