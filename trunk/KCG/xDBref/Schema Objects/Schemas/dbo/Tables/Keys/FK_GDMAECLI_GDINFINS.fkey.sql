﻿ALTER TABLE [dbo].[GDMAECLI]
    ADD CONSTRAINT [FK_GDMAECLI_GDINFINS] FOREIGN KEY ([GD_CODIGO_INSTITUCION]) REFERENCES [dbo].[GDINFINS] ([GD_CODIGO_INSTITUCION]) ON DELETE NO ACTION ON UPDATE NO ACTION;

