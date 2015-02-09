CREATE TABLE [dbo].[Ver_Mensaje] (
    [Id]             VARCHAR (17)  NOT NULL,
    [Codigo]         VARCHAR (200) NOT NULL,
    [Nombre]         VARCHAR (500) NOT NULL,
    [Ver_Version_Id] VARCHAR (17)  NOT NULL,
    [Par_Mensaje_Id] VARCHAR (17)  NOT NULL,
    [Estado]         CHAR (3)      NULL
);

