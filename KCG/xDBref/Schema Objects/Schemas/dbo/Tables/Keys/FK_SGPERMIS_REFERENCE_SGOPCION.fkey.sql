﻿ALTER TABLE [dbo].[SGPERMISOS]
    ADD CONSTRAINT [FK_SGPERMIS_REFERENCE_SGOPCION] FOREIGN KEY ([SG_CODIGO_OPCION]) REFERENCES [dbo].[SGOPCIONES] ([SG_CODIGO_OPCION]) ON DELETE NO ACTION ON UPDATE NO ACTION;
