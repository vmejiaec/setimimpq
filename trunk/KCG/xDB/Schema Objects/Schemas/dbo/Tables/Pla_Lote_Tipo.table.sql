CREATE TABLE [dbo].[Pla_Lote_Tipo] (
    [Id]           INT           IDENTITY (1, 1) NOT NULL,
    [Codigo]       VARCHAR (200) NOT NULL,
    [Nombre]       VARCHAR (500) NOT NULL,
    [Archivo_Tipo] VARCHAR (6)   NOT NULL,
    [Clase]        VARCHAR (100) NOT NULL,
    [Metodo]       VARCHAR (100) NOT NULL
);

