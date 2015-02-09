CREATE TABLE [dbo].[Ver_Dominio] (
    [Id]             VARCHAR (17)  NOT NULL,
    [Codigo]         VARCHAR (200) NOT NULL,
    [Nombre]         VARCHAR (500) NOT NULL,
    [Ver_Version_id] VARCHAR (17)  NOT NULL,
    [Dic_Dominio_id] VARCHAR (17)  NOT NULL,
    [Estado]         CHAR (3)      NULL
);

