CREATE TABLE [dbo].[Seg_Rol_Objeto] (
    [Id]                VARCHAR (17)  NOT NULL,
    [Codigo]            VARCHAR (200) NOT NULL,
    [Seg_Rol_Id]        VARCHAR (17)  NOT NULL,
    [Dic_Con_Objeto_Id] VARCHAR (17)  NOT NULL,
    [Tipo]              CHAR (3)      NOT NULL,
    [Estado]            CHAR (3)      NULL
);

