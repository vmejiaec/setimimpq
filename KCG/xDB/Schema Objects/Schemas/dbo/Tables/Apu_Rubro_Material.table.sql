CREATE TABLE [dbo].[Apu_Rubro_Material] (
    [Id]                               VARCHAR (17)    NOT NULL,
    [Codigo]                           VARCHAR (200)   NOT NULL,
    [Apu_Rubro_Id]                     VARCHAR (17)    NOT NULL,
    [Apu_Material_Id]                  VARCHAR (17)    NOT NULL,
    [Cantidad]                         NUMERIC (17, 4) NOT NULL,
    [Fecha_Update]                     SMALLDATETIME   NOT NULL,
    [Update_Per_Personal_Id]           VARCHAR (17)    NOT NULL,
    [Fecha_Creacion]                   SMALLDATETIME   NOT NULL,
    [Creacion_Per_Personal_Id]         VARCHAR (17)    NOT NULL,
    [UpdateTransporte_Per_Personal_Id] VARCHAR (17)    NOT NULL,
    [Fecha_UpdateTransporte]           SMALLDATETIME   NULL,
    [Estado]                           CHAR (3)        NULL
);

