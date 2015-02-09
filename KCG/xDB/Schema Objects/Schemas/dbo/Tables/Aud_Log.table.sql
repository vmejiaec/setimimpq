CREATE TABLE [dbo].[Aud_Log] (
    [Id]                VARCHAR (17)   NOT NULL,
    [Codigo]            VARCHAR (200)  NOT NULL,
    [Fecha]             SMALLDATETIME  NOT NULL,
    [Accion]            CHAR (3)       NOT NULL,
    [Dic_Contenedor_Id] VARCHAR (17)   NOT NULL,
    [Int_Sucursal_Id]   VARCHAR (17)   NOT NULL,
    [Seg_Rol_Id]        VARCHAR (17)   NOT NULL,
    [Int_Usuario_Id]    VARCHAR (17)   NOT NULL,
    [Ver_Version_Id]    VARCHAR (17)   NOT NULL,
    [Par_Mensaje_Id]    VARCHAR (17)   NULL,
    [Procedimiento]     VARCHAR (500)  NULL,
    [Parametros]        VARCHAR (2000) NULL,
    [Datos]             VARCHAR (8000) NULL,
    [Estado]            CHAR (3)       NULL
);

