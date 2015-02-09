﻿ALTER TABLE [dbo].[SGPERMISOS]
    ADD CONSTRAINT [PK_SGPERMISOS] PRIMARY KEY CLUSTERED ([SG_CODIGO_OPCION] ASC, [GD_CODIGO_INSTITUCION] ASC, [GD_CODIGO_SUCURSAL] ASC, [SG_CODIGO_GRUPO] ASC) WITH (FILLFACTOR = 90, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

