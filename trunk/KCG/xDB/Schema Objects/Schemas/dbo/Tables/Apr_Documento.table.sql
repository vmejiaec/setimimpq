CREATE TABLE [dbo].[Apr_Documento] (
    [Id]           VARCHAR (17)   NOT NULL,
    [Codigo]       VARCHAR (200)  NOT NULL,
    [Nombre]       VARCHAR (500)  NOT NULL,
    [Abreviatura]  VARCHAR (50)   NULL,
    [Dic_Campo_id] VARCHAR (17)   NOT NULL,
    [Estado]       CHAR (3)       NULL,
    [Descripcion]  VARCHAR (2000) NULL
);

