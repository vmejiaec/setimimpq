CREATE TABLE [dbo].[Apu_Oferta_Equipo_Indice] (
    [Id]                   VARCHAR (17)   NOT NULL,
    [Codigo]               VARCHAR (200)  NOT NULL,
    [Apu_Oferta_Equipo_Id] VARCHAR (17)   NOT NULL,
    [Apu_Indice_Id]        VARCHAR (17)   NOT NULL,
    [Porcentaje]           NUMERIC (5, 2) NOT NULL,
    [Estado]               CHAR (3)       NULL
);

