ALTER TABLE [dbo].[Apu_Proyecto_Equipo_Indice]
    ADD CONSTRAINT [FK_Apu_Proyecto_Equipo_Indice_Apu_Proyecto_Equipo] FOREIGN KEY ([Apu_Proyecto_Equipo_Id]) REFERENCES [dbo].[Apu_Proyecto_Equipo] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

