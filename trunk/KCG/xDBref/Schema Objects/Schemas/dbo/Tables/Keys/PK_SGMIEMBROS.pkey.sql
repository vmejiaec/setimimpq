﻿ALTER TABLE [dbo].[SGMIEMBROS]
    ADD CONSTRAINT [PK_SGMIEMBROS] PRIMARY KEY CLUSTERED ([GD_CODIGO_INSTITUCION] ASC, [GD_CODIGO_SUCURSAL] ASC, [SG_CODIGO_GRUPO] ASC, [GD_CODIGO_PERSONA] ASC) WITH (FILLFACTOR = 90, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

