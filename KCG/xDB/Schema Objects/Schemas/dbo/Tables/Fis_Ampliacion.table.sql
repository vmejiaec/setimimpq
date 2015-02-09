CREATE TABLE [dbo].[Fis_Ampliacion] (
    [Id]                 VARCHAR (17)   NOT NULL,
    [Codigo]             VARCHAR (200)  NOT NULL,
    [Estado]             CHAR (3)       NULL,
    [Descripcion]        VARCHAR (2000) NULL,
    [Apu_Presupuesto_Id] VARCHAR (17)   NOT NULL,
    [Nombre]             VARCHAR (500)  NOT NULL,
    [Fecha_Autorizacion] SMALLDATETIME  NOT NULL,
    [Plazo_Dias]         INT            NOT NULL
);

