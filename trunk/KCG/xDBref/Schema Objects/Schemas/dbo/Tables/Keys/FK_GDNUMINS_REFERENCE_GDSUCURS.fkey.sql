﻿ALTER TABLE [dbo].[GDNUMINST]
    ADD CONSTRAINT [FK_GDNUMINS_REFERENCE_GDSUCURS] FOREIGN KEY ([GD_CODIGO_SUCURSAL], [GD_CODIGO_INSTITUCION]) REFERENCES [dbo].[GDSUCURSAL] ([GD_CODIGO_SUCURSAL], [GD_CODIGO_INSTITUCION]) ON DELETE NO ACTION ON UPDATE NO ACTION;

