CREATE TABLE [dbo].[Apu_Oferta_Rubro] (
    [Id]            VARCHAR (17)    NOT NULL,
    [Codigo]        VARCHAR (200)   NOT NULL,
    [Apu_Oferta_Id] VARCHAR (17)    NOT NULL,
    [Apu_Rubro_Id]  VARCHAR (17)    NOT NULL,
    [Cantidad]      NUMERIC (17, 4) NOT NULL,
    [Estado]        CHAR (3)        NULL
);

