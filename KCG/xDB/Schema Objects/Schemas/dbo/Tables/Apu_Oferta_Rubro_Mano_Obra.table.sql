CREATE TABLE [dbo].[Apu_Oferta_Rubro_Mano_Obra] (
    [Id]                       VARCHAR (17)    NOT NULL,
    [Codigo]                   VARCHAR (200)   NOT NULL,
    [Fecha_Creacion]           SMALLDATETIME   NOT NULL,
    [Creacion_Per_Personal_Id] VARCHAR (17)    NOT NULL,
    [Fecha_Update]             SMALLDATETIME   NOT NULL,
    [Update_Per_Personal_Id]   VARCHAR (17)    NOT NULL,
    [Costo]                    NUMERIC (17, 4) NOT NULL,
    [Apu_Oferta_Rubro_Id]      VARCHAR (17)    NOT NULL,
    [Apu_Mano_Obra_Id]         VARCHAR (17)    NOT NULL,
    [Estado]                   CHAR (3)        NULL
);

