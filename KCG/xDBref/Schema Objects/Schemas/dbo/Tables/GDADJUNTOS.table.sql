﻿CREATE TABLE [dbo].[GDADJUNTOS] (
    [GD_CODIGO_INSTITUCION]  VARCHAR (40) NOT NULL,
    [GD_CODIGO_SUCURSAL]     VARCHAR (40) NOT NULL,
    [GD_PERIODO]             VARCHAR (4)  NOT NULL,
    [GD_CODIGO_TRAMITE]      VARCHAR (40) NOT NULL,
    [GD_NUMERO]              INT          NOT NULL,
    [GD_CODIGO_AREA]         VARCHAR (8)  NOT NULL,
    [GD_NUMERO_REESTRUCTURA] INT          NOT NULL,
    [GD_NUMERO_ADJUNTO]      INT          NOT NULL,
    [GD_CODIGO_TAREA]        VARCHAR (40) NOT NULL,
    [GD_NUMERO_SECUENCIAL]   INT          NOT NULL,
    [GD_DETALLE]             TEXT         NULL,
    [GD_CONDICION]           VARCHAR (20) NOT NULL,
    [GD_PERSONA_RESPONSABLE] VARCHAR (20) NOT NULL,
    [GD_FECHA_REGISTRO]      DATETIME     NOT NULL,
    [GD_USUARIO]             VARCHAR (20) NOT NULL,
    [GD_REGISTRADO]          DATETIME     NULL
);
