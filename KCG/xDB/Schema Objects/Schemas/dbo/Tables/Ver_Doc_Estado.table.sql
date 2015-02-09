CREATE TABLE [dbo].[Ver_Doc_Estado] (
    [Id]                VARCHAR (17)   NOT NULL,
    [Codigo]            VARCHAR (200)  NOT NULL,
    [Nombre]            VARCHAR (500)  NOT NULL,
    [Ver_Version_Id]    VARCHAR (17)   NOT NULL,
    [Apr_Doc_Estado_Id] VARCHAR (17)   NOT NULL,
    [Estado]            CHAR (3)       NULL,
    [Descripcion]       VARCHAR (2000) NULL
);

