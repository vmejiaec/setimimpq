﻿ALTER TABLE [dbo].[Apu_Oferta_Rubro]
    ADD CONSTRAINT [FK_Apu_Oferta_Rubro_Apu_Oferta] FOREIGN KEY ([Apu_Oferta_Id]) REFERENCES [dbo].[Apu_Oferta] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

