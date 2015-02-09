ALTER TABLE [dbo].[Apu_Indice_Equipo]
    ADD CONSTRAINT [FK_Apu_Indice_Equipo_Apu_Indice] FOREIGN KEY ([Apu_Indice_Id]) REFERENCES [dbo].[Apu_Indice] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

