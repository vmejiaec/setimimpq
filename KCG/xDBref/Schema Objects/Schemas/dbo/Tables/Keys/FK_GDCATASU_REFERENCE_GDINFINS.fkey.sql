﻿ALTER TABLE [dbo].[GDCATASU]
    ADD CONSTRAINT [FK_GDCATASU_REFERENCE_GDINFINS] FOREIGN KEY ([GD_CODIGO_INSTITUCION]) REFERENCES [dbo].[GDINFINS] ([GD_CODIGO_INSTITUCION]) ON DELETE NO ACTION ON UPDATE NO ACTION;
