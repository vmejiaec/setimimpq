﻿ALTER TABLE [dbo].[GDINFTRA]
    ADD CONSTRAINT [FK_GDINFTRA_GDMAECLI] FOREIGN KEY ([GD_CODIGO_ENTIDAD], [GD_CODIGO_INSTITUCION]) REFERENCES [dbo].[GDMAECLI] ([GD_CODIGO_ENTIDAD], [GD_CODIGO_INSTITUCION]) ON DELETE NO ACTION ON UPDATE NO ACTION;

