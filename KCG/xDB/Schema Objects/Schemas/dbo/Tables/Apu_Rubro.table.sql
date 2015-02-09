CREATE TABLE [dbo].[Apu_Rubro] (
    [Id]                       VARCHAR (17)    NOT NULL,
    [Codigo]                   VARCHAR (200)   NOT NULL,
    [Nombre]                   VARCHAR (500)   NOT NULL,
    [Unidad]                   VARCHAR (200)   NOT NULL,
    [Int_Sucursal_Id]          VARCHAR (17)    NOT NULL,
    [Apu_Subtitulo_Id]         VARCHAR (17)    NOT NULL,
    [Int_Moneda_Id]            VARCHAR (17)    NOT NULL,
    [Rendimiento_Mano_Obra]    NUMERIC (17, 6) NOT NULL,
    [Rendimiento_Equipo]       NUMERIC (17, 6) NOT NULL,
    [Especial]                 VARCHAR (3)     NOT NULL,
    [Disponible]               VARCHAR (3)     NOT NULL,
    [Descripcion]              VARCHAR (4000)  NULL,
    [Creacion_Per_Personal_Id] VARCHAR (17)    NOT NULL,
    [Fecha_Creacion]           SMALLDATETIME   NOT NULL,
    [Update_Per_Personal_Id]   VARCHAR (17)    NOT NULL,
    [Fecha_Update]             SMALLDATETIME   NOT NULL,
    [Estado]                   CHAR (3)        NULL
);

