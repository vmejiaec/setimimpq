CREATE TABLE [dbo].[Dic_Con_Objeto] (
    [Id]                VARCHAR (17)  NOT NULL,
    [Codigo]            VARCHAR (200) NOT NULL,
    [Dic_Contenedor_Id] VARCHAR (17)  NOT NULL,
    [Dic_Objeto_Id]     VARCHAR (17)  NOT NULL,
    [Orden]             INT           NOT NULL,
    [INS]               VARCHAR (3)   NOT NULL,
    [UPD]               VARCHAR (3)   NOT NULL,
    [DEL]               VARCHAR (3)   NOT NULL,
    [Estado]            CHAR (3)      NULL,
    [Maximo]            INT           NULL
);

