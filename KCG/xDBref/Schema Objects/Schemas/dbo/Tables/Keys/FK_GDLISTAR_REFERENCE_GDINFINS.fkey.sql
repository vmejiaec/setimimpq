﻿ALTER TABLE [dbo].[GDLISTAR]
    ADD CONSTRAINT [FK_GDLISTAR_REFERENCE_GDINFINS] FOREIGN KEY ([GD_CODIGO_INSTITUCION]) REFERENCES [dbo].[GDINFINS] ([GD_CODIGO_INSTITUCION]) ON DELETE NO ACTION ON UPDATE NO ACTION;
