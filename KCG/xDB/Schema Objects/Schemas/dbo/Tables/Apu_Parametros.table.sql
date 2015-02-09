CREATE TABLE [dbo].[Apu_Parametros] (
    [Id]                                 VARCHAR (17)   NOT NULL,
    [Codigo]                             VARCHAR (200)  NOT NULL,
    [Equipo_Apu_Indice_Id]               VARCHAR (17)   NULL,
    [ManoObra_Apu_Indice_Id]             VARCHAR (17)   NULL,
    [Porcentaje_Costo_Indirecto]         NUMERIC (5, 2) NOT NULL,
    [Int_Sucursal_Id]                    VARCHAR (17)   NOT NULL,
    [Apu_Mano_Obra_Id]                   VARCHAR (17)   NULL,
    [Estado]                             CHAR (3)       NULL,
    [Apu_Subtitulo_Id_Oferta_Rubro_Pred] VARCHAR (17)   NULL
);

