CREATE TABLE [dbo].[Dic_Dominio] (
    [Id]           VARCHAR (17)  NOT NULL,
    [Codigo]       VARCHAR (200) NOT NULL,
    [Dic_Campo_Id] VARCHAR (17)  NOT NULL,
    [Dominio]      VARCHAR (3)   NOT NULL,
    [Nombre]       VARCHAR (500) NOT NULL,
    [Estado]       CHAR (3)      NULL
);

