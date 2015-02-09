CREATE TABLE [dbo].[Fis_Catalogo] (
    [Id]                       VARCHAR (17)   NOT NULL,
    [Codigo]                   VARCHAR (200)  NOT NULL,
    [Estado]                   CHAR (3)       NULL,
    [Descripcion]              VARCHAR (2000) NULL,
    [Int_Empresa_Id]           VARCHAR (17)   NOT NULL,
    [Fecha_Creacion]           SMALLDATETIME  NOT NULL,
    [Creacion_Per_Personal_Id] VARCHAR (17)   NOT NULL,
    [Fecha_Publicacion]        SMALLDATETIME  NOT NULL,
    [Nombre]                   VARCHAR (500)  NULL
);

