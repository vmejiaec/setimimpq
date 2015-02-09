ALTER TABLE [dbo].[Apu_Proyecto_Equipo_Indice]
    ADD CONSTRAINT [FK_Apu_Proyecto_Equipo_Indice_Apu_Indice] FOREIGN KEY ([Apu_Indice_Id]) REFERENCES [dbo].[Apu_Indice] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

