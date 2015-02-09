CREATE TABLE [dbo].[Dic_Par_Paginacion] (
    [Id]               VARCHAR (17)  NOT NULL,
    [Codigo]           VARCHAR (200) NOT NULL,
    [Dic_Objeto_Id]    VARCHAR (17)  NOT NULL,
    [Par_Servidor_Id]  VARCHAR (17)  NOT NULL,
    [Limite_registros] INT           NOT NULL,
    [Numero_usuarios]  INT           NOT NULL,
    [Umbral]           INT           NOT NULL,
    [Estado]           CHAR (3)      NULL
);

