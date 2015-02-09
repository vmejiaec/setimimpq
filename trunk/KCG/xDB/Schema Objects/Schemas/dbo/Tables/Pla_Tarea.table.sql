CREATE TABLE [dbo].[Pla_Tarea] (
    [Id]         INT           IDENTITY (1, 1) NOT NULL,
    [Codigo]     VARCHAR (200) NOT NULL,
    [Pla_Cta_Id] INT           NOT NULL,
    [Nombre]     VARCHAR (500) NOT NULL,
    [Fecha_Ini]  SMALLDATETIME NOT NULL,
    [Fecha_Fin]  SMALLDATETIME NOT NULL,
    [Estado]     CHAR (3)      NOT NULL
);

