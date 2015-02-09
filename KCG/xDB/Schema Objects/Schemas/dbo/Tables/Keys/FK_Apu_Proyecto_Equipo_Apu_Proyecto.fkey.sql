ALTER TABLE [dbo].[Apu_Proyecto_Equipo]
    ADD CONSTRAINT [FK_Apu_Proyecto_Equipo_Apu_Proyecto] FOREIGN KEY ([Apu_Proyecto_Id]) REFERENCES [dbo].[Apu_Proyecto] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

