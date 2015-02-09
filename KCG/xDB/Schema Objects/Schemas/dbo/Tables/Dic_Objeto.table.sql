CREATE TABLE [dbo].[Dic_Objeto] (
    [Id]            VARCHAR (17)  NOT NULL,
    [Codigo]        VARCHAR (200) NOT NULL,
    [Nombre]        VARCHAR (500) NOT NULL,
    [Dic_Modulo_Id] VARCHAR (17)  NOT NULL,
    [Numero_old]    INT           NOT NULL,
    [Estado]        CHAR (3)      NULL,
    [Numero]        INT           IDENTITY (0, 1) NOT NULL
);

