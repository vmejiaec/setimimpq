CREATE TABLE [dbo].[Apr_Doc_Estado] (
    [Id]               VARCHAR (17)   NOT NULL,
    [Codigo]           VARCHAR (200)  NOT NULL,
    [Apr_Estado_Id]    VARCHAR (17)   NOT NULL,
    [Apr_Documento_Id] VARCHAR (17)   NOT NULL,
    [Estado]           CHAR (3)       NULL,
    [Descripcion]      VARCHAR (2000) NULL,
    [Orden]            INT            NOT NULL
);

