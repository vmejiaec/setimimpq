CREATE TABLE [dbo].[Aud_Par_Log] (
    [Id]                VARCHAR (17)  NOT NULL,
    [Codigo]            VARCHAR (200) NOT NULL,
    [Int_Sucursal_Id]   VARCHAR (17)  NOT NULL,
    [Dic_Contenedor_Id] VARCHAR (17)  NOT NULL,
    [ERR]               VARCHAR (3)   NOT NULL,
    [USR]               VARCHAR (3)   NOT NULL,
    [DDL]               VARCHAR (3)   NOT NULL,
    [EJE]               VARCHAR (3)   NOT NULL,
    [Estado]            CHAR (3)      NULL
);

