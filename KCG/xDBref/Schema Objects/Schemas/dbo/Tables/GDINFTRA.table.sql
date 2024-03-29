﻿CREATE TABLE [dbo].[GDINFTRA] (
    [GD_CODIGO_INSTITUCION]  VARCHAR (40)  NOT NULL,
    [GD_CODIGO_SUCURSAL]     VARCHAR (40)  NOT NULL,
    [GD_PERIODO]             VARCHAR (4)   NOT NULL,
    [GD_NUMERO]              INT           NOT NULL,
    [GD_AREA_REGISTRA]       VARCHAR (8)   NOT NULL,
    [GD_NUMERO_REESTRUCTURA] INT           NOT NULL,
    [GD_CODIGO_TRAMITE]      VARCHAR (40)  NOT NULL,
    [GD_CODIGO_TABLA]        VARCHAR (40)  NOT NULL,
    [GD_TIPO_DOCUMENTO]      VARCHAR (40)  NOT NULL,
    [GD_NUMERO_PETITORIO]    VARCHAR (40)  NOT NULL,
    [GD_CODIGO_ENTIDAD]      INT           NOT NULL,
    [GD_DIRIJIDO_O_ENVIADO]  VARCHAR (50)  NULL,
    [GD_NUMERO_HOJAS]        INT           NOT NULL,
    [GD_FECHA_PETITORIO]     DATETIME      NOT NULL,
    [GD_FECHA_INGRESO]       DATETIME      NOT NULL,
    [GD_PRIORIDAD]           VARCHAR (8)   NOT NULL,
    [GD_RESPUESTA]           VARCHAR (2)   NOT NULL,
    [GD_ANEXOS]              VARCHAR (2)   NOT NULL,
    [GD_DETALLE_ANEXOS]      VARCHAR (255) NULL,
    [GD_CODIGO_ASUNTO]       VARCHAR (40)  NOT NULL,
    [GD_CODIGO_TAREA]        VARCHAR (40)  NOT NULL,
    [GD_ANULADO]             VARCHAR (40)  NOT NULL,
    [GD_OBSERVACION]         VARCHAR (150) NULL,
    [GD_PARALELO]            VARCHAR (2)   NOT NULL,
    [GD_TIEMPO_ESTIMADO]     INT           NOT NULL,
    [GD_IMPRIMR_GCT]         VARCHAR (2)   NULL,
    [GD_ASUNTO]              TEXT          NOT NULL,
    [GD_FECHA_FINALIZA]      VARCHAR (8)   NULL,
    [GD_USUARIO]             VARCHAR (20)  NOT NULL,
    [GD_FECHA_REGISTRO]      DATETIME      NOT NULL,
    [GD_PROYECTO]            INT           NULL,
    [GD_SUBPROYECTO]         INT           NULL
);

