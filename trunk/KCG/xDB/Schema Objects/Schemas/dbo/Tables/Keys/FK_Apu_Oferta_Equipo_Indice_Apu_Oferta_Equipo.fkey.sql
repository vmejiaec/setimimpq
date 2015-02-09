ALTER TABLE [dbo].[Apu_Oferta_Equipo_Indice]
    ADD CONSTRAINT [FK_Apu_Oferta_Equipo_Indice_Apu_Oferta_Equipo] FOREIGN KEY ([Apu_Oferta_Equipo_Id]) REFERENCES [dbo].[Apu_Oferta_Equipo] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

