﻿CREATE TABLE [dbo].[GDSEGTRA] (
    [GD_CODIGO_INSTITUCION]      VARCHAR (40) NOT NULL,
    [GD_CODIGO_SUCURSAL]         VARCHAR (40) NOT NULL,
    [GD_PERIODO]                 VARCHAR (4)  NOT NULL,
    [GD_CODIGO_TRAMITE]          VARCHAR (40) NOT NULL,
    [GD_NUMERO]                  INT          NOT NULL,
    [GD_AREA_RESPONSABLE]        VARCHAR (8)  NOT NULL,
    [GD_NUMERO_REESTRUCTURA]     INT          NOT NULL,
    [GD_NUMERO_SECUENCIAL]       INT          NOT NULL,
    [GD_AREA_SEGUIMIENTO]        VARCHAR (8)  NOT NULL,
    [GD_NUMERO_REESTRUCTURA_SEG] INT          NOT NULL,
    [GD_PERSONA_RESPONSABLE]     VARCHAR (20) NOT NULL,
    [GD_CODIGO_TAREA]            VARCHAR (40) NOT NULL,
    [GD_FECHA_INICIO]            DATETIME     NOT NULL,
    [GD_HORA_INICIO]             VARCHAR (7)  NULL,
    [GD_FECHA_FINAL]             DATETIME     NOT NULL,
    [GD_HORA_FINAL]              VARCHAR (7)  NULL,
    [GD_IMPRIMR_CE]              VARCHAR (2)  NULL,
    [GD_USUARIO]                 VARCHAR (20) NULL,
    [GD_FECHA_REGISTRO]          DATETIME     NULL
);

