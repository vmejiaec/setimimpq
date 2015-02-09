﻿ALTER TABLE [dbo].[GDRESTRA]
    ADD CONSTRAINT [PK_GDRESTRA] PRIMARY KEY CLUSTERED ([GD_CODIGO_INSTITUCION] ASC, [GD_CODIGO_SUCURSAL] ASC, [GD_PERIODO] ASC, [GD_CODIGO_TRAMITE] ASC, [GD_NUMERO] ASC, [GD_SECUENCIAL_RESPUESTA] ASC) WITH (FILLFACTOR = 90, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);
