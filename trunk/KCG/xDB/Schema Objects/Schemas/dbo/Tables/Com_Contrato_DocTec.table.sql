CREATE TABLE [dbo].[Com_Contrato_DocTec] (
    [Id]              INT           IDENTITY (1, 1) NOT NULL,
    [Com_Contrato_Id] INT           NOT NULL,
    [Nombre]          VARCHAR (200) NOT NULL,
    [Tiene]           CHAR (2)      NOT NULL
);

