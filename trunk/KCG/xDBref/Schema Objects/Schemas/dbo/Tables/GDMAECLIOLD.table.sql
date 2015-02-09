﻿CREATE TABLE [dbo].[GDMAECLIOLD] (
    [GD_CODIGO_INSTITUCION]   VARCHAR (40)  NOT NULL,
    [GD_CODIGO_ENTIDAD]       INT           NOT NULL,
    [GD_CODIGO_SUCURSAL]      VARCHAR (40)  NULL,
    [GD_TIPO_ENTIDAD]         VARCHAR (40)  NOT NULL,
    [GD_NOMBRE]               VARCHAR (70)  NULL,
    [GD_DIRECCION]            VARCHAR (120) NULL,
    [GD_NUMERO_TELEFONICO]    VARCHAR (60)  NULL,
    [GD_NUMERO_FAX]           VARCHAR (60)  NULL,
    [GD_DIRECCION_EMAIL]      VARCHAR (120) NULL,
    [GD_CONTRATISTA]          VARCHAR (2)   NOT NULL,
    [GD_ACTIVA]               VARCHAR (2)   NOT NULL,
    [GD_ULTIMA_ACTUALIZACION] DATETIME      NULL,
    [GD_OBSERVACION]          VARCHAR (255) NULL,
    [GD_USUARIO]              VARCHAR (20)  NOT NULL,
    [GD_FECHA_REGISTRO]       DATETIME      NOT NULL,
    [GD_NUMERO_CELULAR]       VARCHAR (30)  NULL,
    [GD_CONTACTO]             VARCHAR (40)  NULL,
    [GD_RAZON_SOCIAL]         VARCHAR (70)  NULL,
    [GD_NUMERO_RUC]           VARCHAR (16)  NULL
);

