CREATE TABLE [dbo].[Dic_Codigo] (
    [Id]               VARCHAR (17)   NOT NULL,
    [Codigo]           VARCHAR (200)  NOT NULL,
    [Tipo]             CHAR (3)       NOT NULL,
    [Orden]            INT            NOT NULL,
    [Dic_Campo_Id]     VARCHAR (17)   NOT NULL,
    [Act_Dic_Campo_id] VARCHAR (17)   NULL,
    [Ref_Dic_Campo_Id] VARCHAR (17)   NULL,
    [Dic_Secuencia_Id] VARCHAR (17)   NULL,
    [Pre_Dic_Campo_Id] VARCHAR (17)   NULL,
    [Constante]        VARCHAR (200)  NULL,
    [Funcion]          VARCHAR (8000) NULL,
    [Estado]           CHAR (3)       NULL
);

