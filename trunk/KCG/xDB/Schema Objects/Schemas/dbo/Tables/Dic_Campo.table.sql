CREATE TABLE [dbo].[Dic_Campo] (
    [Id]              VARCHAR (17)  NOT NULL,
    [Codigo]          VARCHAR (200) NOT NULL,
    [Nombre]          VARCHAR (500) NOT NULL,
    [Dic_Objeto_Id]   VARCHAR (17)  NOT NULL,
    [Tipo_Dato]       CHAR (3)      NOT NULL,
    [Tipo_Constraint] CHAR (3)      NOT NULL,
    [Filtro]          VARCHAR (3)   NOT NULL,
    [Estado]          CHAR (3)      NULL
);

