CREATE TABLE [dbo].[Aud_Auditoria] (
    [Id]                VARCHAR (17)   NOT NULL,
    [Codigo]            VARCHAR (200)  NOT NULL,
    [Nombre]            VARCHAR (500)  NOT NULL,
    [Accion]            CHAR (3)       NOT NULL,
    [Fecha]             SMALLDATETIME  NOT NULL,
    [Id_Origen]         VARCHAR (17)   NULL,
    [Codigo_Origen]     VARCHAR (200)  NULL,
    [Seg_Rol_Id]        VARCHAR (17)   NOT NULL,
    [Dic_Objeto_Id]     VARCHAR (17)   NOT NULL,
    [Int_Usuario_Id]    VARCHAR (17)   NOT NULL,
    [Dic_Contenedor_Id] VARCHAR (17)   NULL,
    [Int_Sucursal_Id]   VARCHAR (17)   NOT NULL,
    [Campos]            VARCHAR (8000) NOT NULL,
    [Estado]            CHAR (3)       NULL
);

