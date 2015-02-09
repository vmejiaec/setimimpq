﻿CREATE TABLE [dbo].[GDLISTAR] (
    [GD_CODIGO_INSTITUCION] VARCHAR (40)  NOT NULL,
    [GD_CODIGO_TAREA]       VARCHAR (40)  NOT NULL,
    [GD_NOMBRE_TAREA]       VARCHAR (60)  NOT NULL,
    [GD_CODIGO_TRAMITE]     VARCHAR (40)  NOT NULL,
    [GD_DESCRIPCION_TAREA]  VARCHAR (200) NULL,
    [GD_NOMBRE_CORTO]       VARCHAR (20)  NULL,
    [GD_TIEMPO_ESTIMADO]    INT           NULL,
    [GD_UNIDAD_TIEMPO]      VARCHAR (8)   NULL,
    [GD_CONTROL_TAREA]      VARCHAR (2)   NULL,
    [GD_ICONO_ASOCIADO]     VARCHAR (40)  NULL,
    [GD_ACTIVA_LISTA]       VARCHAR (20)  NULL,
    [GD_USUARIO]            VARCHAR (20)  NOT NULL,
    [GD_FECHA_REGISTRO]     DATETIME      NOT NULL
);
