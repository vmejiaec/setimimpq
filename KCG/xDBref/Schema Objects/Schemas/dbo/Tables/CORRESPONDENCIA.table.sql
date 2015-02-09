﻿CREATE TABLE [dbo].[CORRESPONDENCIA] (
    [CAT_COD]            INT           NOT NULL,
    [CAT_CONFIRMADO]     INT           NOT NULL,
    [CAT_NOMBRE]         VARCHAR (70)  NOT NULL,
    [CAT_DIRECCION]      VARCHAR (100) NULL,
    [CAT_TELEFONO]       VARCHAR (60)  DEFAULT ('N/D') NOT NULL,
    [CAT_FAX]            VARCHAR (25)  DEFAULT ('N/D') NOT NULL,
    [CAT_EMAIL]          VARCHAR (120) NULL,
    [CAT_CONTRATISTA]    VARCHAR (2)   DEFAULT ('NO') NOT NULL,
    [CAT_OBSERVACION]    VARCHAR (100) NULL,
    [CAT_FECHA_REGISTRO] DATETIME      NULL,
    [CAT_REPETIDO]       VARCHAR (8)   NULL
);
