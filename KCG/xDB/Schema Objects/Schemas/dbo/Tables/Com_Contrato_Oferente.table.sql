CREATE TABLE [dbo].[Com_Contrato_Oferente] (
    [Id]                     INT           IDENTITY (1, 1) NOT NULL,
    [Nombre]                 VARCHAR (200) NOT NULL,
    [Fecha_Recepcion]        SMALLDATETIME NOT NULL,
    [Com_Contrato_Id]        INT           NOT NULL,
    [Per_Personal_Id_Recibe] VARCHAR (17)  NOT NULL,
    [Comentario]             VARCHAR (500) NOT NULL
);

