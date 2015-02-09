CREATE TABLE [dbo].[His_Historico] (
    [Id]                  VARCHAR (17)   NOT NULL,
    [Codigo]              VARCHAR (200)  NOT NULL,
    [Dic_Objeto_Id]       VARCHAR (17)   NOT NULL,
    [Dic_Objeto_Codigo]   VARCHAR (200)  NOT NULL,
    [Dic_Objeto_Nombe]    VARCHAR (500)  NOT NULL,
    [Fecha_Creacion]      DATETIME       NOT NULL,
    [Per_Personal_Id]     VARCHAR (17)   NOT NULL,
    [Per_Personal_Codigo] VARCHAR (200)  NOT NULL,
    [Per_Personal_Nombre] VARCHAR (500)  NOT NULL,
    [Int_Usuario_Id]      VARCHAR (17)   NOT NULL,
    [Int_Usuario_Codigo]  VARCHAR (200)  NOT NULL,
    [Int_Usuario_Nombre]  VARCHAR (500)  NOT NULL,
    [Int_Empresa_Id]      VARCHAR (17)   NOT NULL,
    [Int_Empresa_Codigo]  VARCHAR (200)  NOT NULL,
    [Int_Empresa_Nombre]  VARCHAR (500)  NOT NULL,
    [Int_Sucursal_Id]     VARCHAR (17)   NOT NULL,
    [Int_Sucursal_Codigo] VARCHAR (200)  NOT NULL,
    [Int_Sucursal_Nombre] VARCHAR (500)  NOT NULL,
    [Descripcion]         VARCHAR (2000) NULL,
    [Estado]              CHAR (3)       NULL
);

