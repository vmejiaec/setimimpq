﻿CREATE TABLE [dbo].[GDSECTAR] (
    [GD_TAREA_INICIAL]      VARCHAR (40) NOT NULL,
    [GD_TAREA_FINAL]        VARCHAR (40) NOT NULL,
    [GD_CODIGO_TRAMITE]     VARCHAR (40) NOT NULL,
    [GD_CODIGO_INSTITUCION] VARCHAR (40) NOT NULL,
    [GD_USUARIO]            VARCHAR (20) NOT NULL,
    [GD_FECHA_REGISTRO]     DATETIME     NOT NULL,
    [GD_ACTIVAR]            VARCHAR (40) NULL
);
