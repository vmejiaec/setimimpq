﻿CREATE TABLE [dbo].[CONTRATISTAS] (
    [NOVEDAD]             VARCHAR (10)  NULL,
    [ID_CONTRATISTA]      INT           NOT NULL,
    [ID_SIGDOC]           INT           NULL,
    [NOMBRE_CONTRATISTA]  VARCHAR (70)  NOT NULL,
    [TIPO_CONTRATISTA]    VARCHAR (40)  NOT NULL,
    [NUMERO_RUC]          VARCHAR (16)  DEFAULT ('N/D') NOT NULL,
    [DIRECCION]           VARCHAR (100) NULL,
    [NUMERO_TELEFONICO]   VARCHAR (60)  DEFAULT ('N/D') NOT NULL,
    [DIRECCION_EMAIL]     VARCHAR (120) NULL,
    [NOMBRE_CONTACTO]     VARCHAR (50)  NULL,
    [ESTADO_CONTRATISTA]  VARCHAR (10)  DEFAULT ('ACTIVO') NOT NULL,
    [FECHA_REGISTRO]      DATETIME      NOT NULL,
    [FECHA_ACTUALIZACION] DATETIME      NULL,
    [USUARIO_REGISTRO]    VARCHAR (10)  NOT NULL,
    [OBSERVACIONES]       VARCHAR (255) NULL
);

