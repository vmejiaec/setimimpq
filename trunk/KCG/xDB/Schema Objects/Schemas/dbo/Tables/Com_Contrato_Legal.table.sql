CREATE TABLE [dbo].[Com_Contrato_Legal] (
    [Id]                   INT           IDENTITY (1, 1) NOT NULL,
    [Com_Contrato_Id]      INT           NOT NULL,
    [Com_Contrato_Tipo_Id] INT           NOT NULL,
    [URL_Contrato_Word]    VARCHAR (250) NOT NULL,
    [URL_Contrato_Scan]    VARCHAR (250) NOT NULL,
    [Desc_Alerta_1]        VARCHAR (500) NOT NULL,
    [Desc_Alerta_2]        VARCHAR (500) NOT NULL,
    [Desc_Alerta_3]        VARCHAR (500) NOT NULL,
    [Fecha_Firma_Contrato] SMALLDATETIME NOT NULL,
    [Fecha_Contrato]       SMALLDATETIME NOT NULL
);

