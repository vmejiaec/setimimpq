CREATE TABLE [dbo].[Apu_Oferta_Rubro_Material] (
    [Id]                               VARCHAR (17)    NOT NULL,
    [Codigo]                           VARCHAR (200)   NOT NULL,
    [Apu_Oferta_Rubro_Id]              VARCHAR (17)    NOT NULL,
    [Apu_Material_Id]                  VARCHAR (17)    NOT NULL,
    [Costo]                            NUMERIC (17, 4) NOT NULL,
    [Costo_Transporte]                 NUMERIC (17, 4) NOT NULL,
    [Fecha_Creacion]                   SMALLDATETIME   NOT NULL,
    [Creacion_Per_Personal_Id]         VARCHAR (17)    NOT NULL,
    [Fecha_Update]                     SMALLDATETIME   NOT NULL,
    [Update_Per_Personal_Id]           VARCHAR (17)    NOT NULL,
    [Fecha_UpdateTransporte]           SMALLDATETIME   NULL,
    [UpdateTransporte_Per_Personal_Id] VARCHAR (17)    NULL,
    [Estado]                           CHAR (3)        NULL
);

