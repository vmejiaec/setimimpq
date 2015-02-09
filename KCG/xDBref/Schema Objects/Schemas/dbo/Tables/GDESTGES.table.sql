﻿CREATE TABLE [dbo].[GDESTGES] (
    [GD_CODIGO_INSTITUCION]  VARCHAR (40)  NOT NULL,
    [GD_PERIODO_GESTION]     VARCHAR (4)   NOT NULL,
    [GD_CODIGO_TRAMITE]      VARCHAR (40)  NULL,
    [GD_DESCRIPCION_PERIODO] DATETIME      NOT NULL,
    [GD_HASTA_PERIODO]       DATETIME      NOT NULL,
    [GD_NUMERO_TOTAL]        INT           NOT NULL,
    [GD_OBSERVACION]         VARCHAR (255) NULL,
    [GD_USUARIO]             VARCHAR (20)  NOT NULL,
    [GD_FECHA_REGISTRO]      DATETIME      NOT NULL
);
