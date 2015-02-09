CREATE TABLE [dbo].[Com_Contrato_Tipo_Marca] (
    [Id]                   INT           IDENTITY (1, 1) NOT NULL,
    [Nombre]               VARCHAR (300) NOT NULL,
    [Com_Contrato_Tipo_Id] INT           NOT NULL,
    [Origen]               VARCHAR (300) NOT NULL,
    [Descripcion]          VARCHAR (500) NULL
);

