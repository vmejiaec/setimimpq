CREATE TABLE [dbo].[Dic_Pantalla] (
    [Id]                 VARCHAR (17)  NOT NULL,
    [Codigo]             VARCHAR (200) NOT NULL,
    [Nombre]             VARCHAR (500) NOT NULL,
    [Estado]             CHAR (3)      NULL,
    [Dic_Rotulo_Id]      VARCHAR (17)  NOT NULL,
    [Tool_Dic_Rotulo_Id] VARCHAR (17)  NOT NULL
);

