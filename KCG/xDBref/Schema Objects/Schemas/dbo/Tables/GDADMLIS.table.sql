﻿CREATE TABLE [dbo].[GDADMLIS] (
    [GD_CODIGO_INSTITUCION] VARCHAR (40)  NOT NULL,
    [GD_CODIGO_ITEM]        VARCHAR (40)  NOT NULL,
    [GD_CODIGO_TABLA]       VARCHAR (20)  NOT NULL,
    [GD_NOMBRE]             VARCHAR (60)  NOT NULL,
    [GD_DESCRIPCION_CORTA]  VARCHAR (20)  NULL,
    [GD_SECUENCIAL_ITEM]    INT           NOT NULL,
    [GD_ACTIVO_ITEM]        VARCHAR (2)   NOT NULL,
    [GD_OBSERVACION]        VARCHAR (255) NULL,
    [GD_USUARIO]            VARCHAR (20)  NOT NULL,
    [GD_FECHA_REGISTRO]     DATETIME      NOT NULL
);
