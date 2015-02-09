CREATE TABLE [dbo].[Dic_General] (
    [Id]                 VARCHAR (17)  NOT NULL,
    [Codigo]             VARCHAR (200) NOT NULL,
    [Nombre]             VARCHAR (500) NOT NULL,
    [Tipo]               CHAR (3)      NOT NULL,
    [Dominio]            CHAR (3)      NULL,
    [Orden]              INT           NOT NULL,
    [Dic_Rotulo_Id]      VARCHAR (17)  NULL,
    [Tool_Dic_Rotulo_id] VARCHAR (17)  NULL,
    [Estado]             CHAR (10)     NULL
);

