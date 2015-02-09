CREATE TABLE [dbo].[Dic_Con_Campo] (
    [Id]                 VARCHAR (17)  NOT NULL,
    [Codigo]             VARCHAR (200) NOT NULL,
    [Dic_Con_Objeto_Id]  VARCHAR (17)  NOT NULL,
    [Dic_Campo_Id]       VARCHAR (17)  NOT NULL,
    [Dic_Rotulo_Id]      VARCHAR (17)  NOT NULL,
    [Tool_Dic_Rotulo_Id] VARCHAR (17)  NOT NULL,
    [Ancho]              INT           NOT NULL,
    [Orden]              INT           NOT NULL,
    [Estado]             CHAR (3)      NULL
);

