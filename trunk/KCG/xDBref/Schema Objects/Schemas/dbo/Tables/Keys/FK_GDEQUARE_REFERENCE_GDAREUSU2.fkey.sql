﻿ALTER TABLE [dbo].[GDEQUARE]
    ADD CONSTRAINT [FK_GDEQUARE_REFERENCE_GDAREUSU2] FOREIGN KEY ([GD_AREA_NUEVA], [GD_REEST_NUEVA], [GD_CODIGO_INSTITUCION], [GD_CODIGO_SUCURSAL]) REFERENCES [dbo].[GDAREUSU] ([GD_CODIGO_AREA], [GD_NUMERO_REESTRUCTURA], [GD_CODIGO_INSTITUCION], [GD_CODIGO_SUCURSAL]) ON DELETE NO ACTION ON UPDATE NO ACTION;

