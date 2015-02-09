CREATE TABLE [dbo].[Dic_Objeto_Det] (
    [Id]                      VARCHAR (17)   NOT NULL,
    [Codigo]                  VARCHAR (200)  NOT NULL,
    [Tipo]                    CHAR (3)       NOT NULL,
    [Dic_Objeto_Id]           VARCHAR (17)   NOT NULL,
    [Parametro_Dic_Objeto_Id] VARCHAR (17)   NOT NULL,
    [Condicion]               VARCHAR (2000) NULL,
    [Metodo]                  VARCHAR (500)  NULL,
    [Estado]                  CHAR (3)       NULL
);

