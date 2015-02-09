CREATE TABLE [dbo].[Pla_Cta] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Anio]        CHAR (4)       NOT NULL,
    [Codigo]      VARCHAR (200)  NOT NULL,
    [Nivel]       CHAR (3)       NOT NULL,
    [Nombre]      VARCHAR (500)  NOT NULL,
    [Descripcion] VARCHAR (1000) NULL,
    [Estado]      CHAR (3)       NOT NULL
);

