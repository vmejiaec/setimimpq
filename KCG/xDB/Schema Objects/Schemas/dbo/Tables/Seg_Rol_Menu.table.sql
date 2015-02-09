CREATE TABLE [dbo].[Seg_Rol_Menu] (
    [Id]                  VARCHAR (17)  NOT NULL,
    [Codigo]              VARCHAR (200) NOT NULL,
    [Dic_Pantalla_Id]     VARCHAR (17)  NULL,
    [Grupo]               CHAR (3)      NULL,
    [Seg_Rol_Id]          VARCHAR (17)  NOT NULL,
    [Dic_Con_Elemento_Id] VARCHAR (17)  NOT NULL,
    [Estado]              CHAR (3)      NULL
);

