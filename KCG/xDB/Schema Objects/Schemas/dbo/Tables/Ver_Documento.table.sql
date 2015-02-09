CREATE TABLE [dbo].[Ver_Documento] (
    [Id]               VARCHAR (17)  NOT NULL,
    [Codigo]           VARCHAR (200) NOT NULL,
    [Nombre]           VARCHAR (500) NOT NULL,
    [Apr_Documento_Id] VARCHAR (17)  NOT NULL,
    [Ver_Version_id]   VARCHAR (17)  NOT NULL,
    [Estado]           CHAR (3)      NULL
);

