﻿CREATE TABLE [dbo].[Apu_Lugar] (
    [Id]               VARCHAR (17)  NOT NULL,
    [Codigo]           VARCHAR (200) NOT NULL,
    [Nombre]           VARCHAR (500) NOT NULL,
    [Apu_Provincia_Id] VARCHAR (17)  NOT NULL,
    [Int_Empresa_Id]   VARCHAR (17)  NOT NULL,
    [Predeterminada]   VARCHAR (3)   NOT NULL,
    [Estado]           CHAR (3)      NULL
);

