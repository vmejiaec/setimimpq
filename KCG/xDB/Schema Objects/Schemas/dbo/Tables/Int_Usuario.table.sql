CREATE TABLE [dbo].[Int_Usuario] (
    [Id]                   VARCHAR (17)  NOT NULL,
    [Codigo]               VARCHAR (200) NOT NULL,
    [Nombre]               VARCHAR (500) NOT NULL,
    [Salt]                 VARCHAR (20)  NOT NULL,
    [Password]             VARCHAR (50)  NOT NULL,
    [Usuario_Id_Ref]       VARCHAR (200) NULL,
    [Per_Personal_Id]      VARCHAR (17)  NULL,
    [Pred_Seg_Rol_id]      VARCHAR (17)  NULL,
    [Pred_Ver_Version_id]  VARCHAR (17)  NULL,
    [Pred_Int_Sucursal_id] VARCHAR (17)  NULL,
    [Estado]               CHAR (3)      NULL
);

