CREATE TABLE [dbo].[Aud_Par_Auditoria] (
    [Id]              VARCHAR (17)  NOT NULL,
    [Codigo]          VARCHAR (200) NOT NULL,
    [Int_Sucursal_Id] VARCHAR (17)  NOT NULL,
    [Dic_Objeto_Id]   VARCHAR (17)  NOT NULL,
    [INS]             VARCHAR (3)   NOT NULL,
    [UPD]             VARCHAR (3)   NOT NULL,
    [DEL]             VARCHAR (3)   NOT NULL,
    [UNI]             VARCHAR (3)   NOT NULL,
    [SEL]             VARCHAR (3)   NOT NULL,
    [BIN]             VARCHAR (3)   NOT NULL,
    [BUP]             VARCHAR (3)   NOT NULL,
    [BDE]             VARCHAR (3)   NOT NULL,
    [Estado]          CHAR (3)      NULL
);

