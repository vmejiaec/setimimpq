﻿ALTER TABLE [dbo].[Apu_Oferta_Equipo]
    ADD CONSTRAINT [FK_Apu_Oferta_Equipo_Apu_Equipo] FOREIGN KEY ([Apu_Equipo_Id]) REFERENCES [dbo].[Apu_Equipo] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

