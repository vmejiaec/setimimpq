CREATE TABLE [dbo].[Dic_Paginacion] (
    [Id]              VARCHAR (17)  NOT NULL,
    [Codigo]          VARCHAR (200) NOT NULL,
    [Dic_Objeto_Id]   VARCHAR (17)  NOT NULL,
    [Par_Servidor_Id] VARCHAR (17)  NOT NULL,
    [Id_Inicial]      VARCHAR (17)  NOT NULL,
    [Id_Final]        VARCHAR (17)  NOT NULL,
    [Secuencia]       INT           NOT NULL,
    [Estado]          CHAR (3)      NULL
);

