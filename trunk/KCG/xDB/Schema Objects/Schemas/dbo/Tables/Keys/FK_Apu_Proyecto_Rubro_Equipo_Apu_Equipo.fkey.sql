ALTER TABLE [dbo].[Apu_Proyecto_Rubro_Equipo]
    ADD CONSTRAINT [FK_Apu_Proyecto_Rubro_Equipo_Apu_Equipo] FOREIGN KEY ([Apu_Equipo_Id]) REFERENCES [dbo].[Apu_Equipo] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

