﻿ALTER TABLE [dbo].[GDEQUARE]
    ADD CONSTRAINT [PK_GDEQUARE] PRIMARY KEY CLUSTERED ([GD_AREA_ANTERIOR] ASC, [GD_REEST_ANTERIOR] ASC, [GD_CODIGO_INSTITUCION] ASC, [GD_CODIGO_SUCURSAL] ASC, [GD_AREA_NUEVA] ASC, [GD_REEST_NUEVA] ASC) WITH (FILLFACTOR = 90, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

