CREATE TABLE [dbo].[Dic_Secuencia] (
    [Id]           VARCHAR (17)  NOT NULL,
    [Codigo]       VARCHAR (200) NOT NULL,
    [Nombre]       VARCHAR (500) NOT NULL,
    [Valor_Actual] INT           NOT NULL,
    [Valor_Minimo] INT           NOT NULL,
    [Valor_Maximo] INT           NOT NULL,
    [Incremento]   INT           NOT NULL,
    [Estado]       CHAR (3)      NULL
);

