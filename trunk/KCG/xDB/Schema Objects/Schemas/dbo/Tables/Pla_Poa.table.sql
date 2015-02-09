CREATE TABLE [dbo].[Pla_Poa] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [Codigo]         VARCHAR (200) NOT NULL,
    [Pla_Tarea_Id]   INT           NOT NULL,
    [Pla_Partida_Id] INT           NOT NULL,
    [Estado]         CHAR (3)      NOT NULL
);

