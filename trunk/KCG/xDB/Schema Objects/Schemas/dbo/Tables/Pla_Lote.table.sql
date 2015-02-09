CREATE TABLE [dbo].[Pla_Lote] (
    [Id]               INT            IDENTITY (1, 1) NOT NULL,
    [Codigo]           VARCHAR (200)  NOT NULL,
    [Nombre]           VARCHAR (500)  NOT NULL,
    [URL_Archivo_IN]   VARCHAR (500)  NOT NULL,
    [Pla_Lote_Tipo_Id] INT            NOT NULL,
    [Resultado]        VARCHAR (1000) NOT NULL,
    [URL_Archivo_OUT]  VARCHAR (500)  NOT NULL,
    [Estado]           CHAR (3)       NOT NULL,
    [Lote_Fecha]       SMALLDATETIME  NOT NULL
);

