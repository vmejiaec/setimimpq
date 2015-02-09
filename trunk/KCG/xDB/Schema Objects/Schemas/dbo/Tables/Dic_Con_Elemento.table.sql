CREATE TABLE [dbo].[Dic_Con_Elemento] (
    [Id]                 VARCHAR (17)  NOT NULL,
    [Codigo]             VARCHAR (200) NOT NULL,
    [Tipo]               CHAR (3)      NOT NULL,
    [Nombre]             VARCHAR (500) NOT NULL,
    [Dic_Contenedor_id]  VARCHAR (17)  NOT NULL,
    [Dic_Rotulo_id]      VARCHAR (17)  NOT NULL,
    [Tool_Dic_Rotulo_Id] VARCHAR (17)  NOT NULL,
    [Estado]             CHAR (3)      NULL
);

