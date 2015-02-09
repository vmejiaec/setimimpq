﻿CREATE TABLE [dbo].[GDASIRES] (
    [GD_CODIGO_INSTITUCION]  VARCHAR (40) NOT NULL,
    [GD_CODIGO_SUCURSAL]     VARCHAR (40) NOT NULL,
    [GD_PERIODO]             VARCHAR (4)  NOT NULL,
    [GD_NUMERO]              INT          NOT NULL,
    [GD_CODIGO_TRAMITE]      VARCHAR (40) NOT NULL,
    [GD_AREA_RESPONSABLE]    VARCHAR (8)  NOT NULL,
    [GD_NUMERO_REESTRUCTURA] INT          NOT NULL,
    [GD_SECUENCIA_AREA]      CHAR (10)    NOT NULL,
    [GD_ULTIMA_TAREA]        VARCHAR (40) NOT NULL,
    [GD_RESPONSABLE]         VARCHAR (20) NULL,
    [GD_IMPRIMIR_GC]         VARCHAR (2)  NULL,
    [GD_USUARIO]             VARCHAR (20) NOT NULL,
    [GD_FECHA_REGISTRO]      DATETIME     NOT NULL
);
