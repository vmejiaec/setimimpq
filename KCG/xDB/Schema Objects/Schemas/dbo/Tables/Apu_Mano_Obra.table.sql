CREATE TABLE [dbo].[Apu_Mano_Obra] (
    [Id]                       VARCHAR (17)    NOT NULL,
    [Codigo]                   VARCHAR (200)   NOT NULL,
    [Nombre]                   VARCHAR (500)   NOT NULL,
    [Disponible]               VARCHAR (3)     NOT NULL,
    [Costo_Diario]             NUMERIC (17, 4) NOT NULL,
    [Apu_Categoria_Id]         VARCHAR (17)    NULL,
    [Int_Sucursal_Id]          VARCHAR (17)    NOT NULL,
    [Int_Moneda_Id]            VARCHAR (17)    NOT NULL,
    [Fecha_Creacion]           SMALLDATETIME   NOT NULL,
    [Creacion_Per_Personal_Id] VARCHAR (17)    NOT NULL,
    [Fecha_Update]             SMALLDATETIME   NOT NULL,
    [Update_Per_Personal_Id]   VARCHAR (17)    NOT NULL,
    [Estado]                   CHAR (3)        NULL
);

