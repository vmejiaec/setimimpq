CREATE TABLE [dbo].[Apu_Rubro_Documento] (
    [Id]           VARCHAR (17)   NOT NULL,
    [Codigo]       VARCHAR (200)  NOT NULL,
    [Apu_Rubro_Id] VARCHAR (17)   NOT NULL,
    [Nombre]       VARCHAR (500)  NOT NULL,
    [Ruta]         VARCHAR (2000) NOT NULL,
    [Descripcion]  VARCHAR (4000) NULL,
    [Estado]       CHAR (3)       NULL
);

