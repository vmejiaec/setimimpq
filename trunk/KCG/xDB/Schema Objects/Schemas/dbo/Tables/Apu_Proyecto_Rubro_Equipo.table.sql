CREATE TABLE [dbo].[Apu_Proyecto_Rubro_Equipo] (
    [Id]                       VARCHAR (17)    NOT NULL,
    [Codigo]                   VARCHAR (200)   NOT NULL,
    [Apu_Proyecto_Rubro_Id]    VARCHAR (17)    NOT NULL,
    [Apu_Equipo_Id]            VARCHAR (17)    NOT NULL,
    [Cantidad]                 NUMERIC (17, 4) NOT NULL,
    [Fecha_Creacion]           SMALLDATETIME   NOT NULL,
    [Creacion_Per_Personal_Id] VARCHAR (17)    NOT NULL,
    [Fecha_Update]             SMALLDATETIME   NOT NULL,
    [Update_Per_Personal_Id]   VARCHAR (17)    NOT NULL,
    [Estado]                   CHAR (3)        NULL
);

