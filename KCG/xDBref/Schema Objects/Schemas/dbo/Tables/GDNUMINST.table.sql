﻿CREATE TABLE [dbo].[GDNUMINST] (
    [GD_CODIGO_INSTITUCION]   VARCHAR (40) NOT NULL,
    [GD_CODIGO_SUCURSAL]      VARCHAR (40) NOT NULL,
    [GD_PERIODO_VIGENCIA]     VARCHAR (4)  NOT NULL,
    [GD_CODIGO_TRAMITE]       VARCHAR (40) NOT NULL,
    [GD_NUMERO_INSTITUCIONAL] INT          NOT NULL,
    [GD_ESTADO]               VARCHAR (40) NOT NULL,
    [GD_USUARIO]              VARCHAR (20) NOT NULL,
    [GD_FECHA_REGISTRO]       DATETIME     NOT NULL
);
