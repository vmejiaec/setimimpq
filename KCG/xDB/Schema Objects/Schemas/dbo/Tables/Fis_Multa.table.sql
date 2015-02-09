CREATE TABLE [dbo].[Fis_Multa] (
    [Id]             VARCHAR (17)   NOT NULL,
    [Codigo]         VARCHAR (200)  NOT NULL,
    [Nombre]         VARCHAR (500)  NOT NULL,
    [Estado]         CHAR (3)       NULL,
    [Descripcion]    VARCHAR (2000) NULL,
    [Int_Empresa_Id] VARCHAR (17)   NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);

