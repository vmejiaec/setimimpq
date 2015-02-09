﻿CREATE TABLE [dbo].[SGOPCIONES] (
    [SG_CODIGO_OPCION]  VARCHAR (40)  NOT NULL,
    [SG_NOMBRE]         VARCHAR (60)  NOT NULL,
    [SG_DESCRIPCION]    VARCHAR (200) NULL,
    [SG_TIPO_OPCION]    VARCHAR (40)  NOT NULL,
    [SG_CODIGO_PADRE]   VARCHAR (40)  NULL,
    [SG_ORDEN]          INT           NOT NULL,
    [SG_USUARIO]        VARCHAR (20)  NOT NULL,
    [SG_FECHA_REGISTRO] DATETIME      NOT NULL
);

