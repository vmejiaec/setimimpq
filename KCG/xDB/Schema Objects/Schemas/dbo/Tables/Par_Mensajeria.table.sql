CREATE TABLE [dbo].[Par_Mensajeria] (
    [Id]                VARCHAR (17)   NOT NULL,
    [Codigo]            VARCHAR (200)  NOT NULL,
    [Fecha]             DATETIME       NOT NULL,
    [Int_Usuario_Id]    VARCHAR (17)   NOT NULL,
    [Dic_Con_Objeto_Id] VARCHAR (17)   NOT NULL,
    [Id_Origen]         VARCHAR (17)   NOT NULL,
    [Descripcion]       VARCHAR (8000) NOT NULL,
    [Estado]            CHAR (3)       NULL
);

