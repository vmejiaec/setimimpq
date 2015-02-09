CREATE TABLE [dbo].[Apu_Oferta_Transporte_Indice] (
    [Id]            VARCHAR (17)   NOT NULL,
    [Codigo]        VARCHAR (200)  NOT NULL,
    [Apu_Oferta_Id] VARCHAR (17)   NOT NULL,
    [Apu_Indice_Id] VARCHAR (17)   NOT NULL,
    [Porcentaje]    NUMERIC (5, 2) NOT NULL,
    [Estado]        CHAR (3)       NULL
);

