CREATE TABLE [dbo].[Apu_Proyecto_Rubro] (
    [Id]                    VARCHAR (17)    NOT NULL,
    [Codigo]                VARCHAR (200)   NOT NULL,
    [Apu_Proyecto_Id]       VARCHAR (17)    NOT NULL,
    [Apu_Rubro_Id]          VARCHAR (17)    NOT NULL,
    [Cantidad]              NUMERIC (17, 4) NOT NULL,
    [Rendimiento_Mano_Obra] NUMERIC (17, 6) NOT NULL,
    [Rendimiento_Equipo]    NUMERIC (17, 6) NOT NULL,
    [Apu_Subtitulo_Id]      VARCHAR (17)    NOT NULL,
    [Estado]                CHAR (3)        NULL
);

