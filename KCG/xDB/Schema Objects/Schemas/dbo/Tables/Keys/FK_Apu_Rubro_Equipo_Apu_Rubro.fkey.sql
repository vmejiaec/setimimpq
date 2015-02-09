ALTER TABLE [dbo].[Apu_Rubro_Equipo]
    ADD CONSTRAINT [FK_Apu_Rubro_Equipo_Apu_Rubro] FOREIGN KEY ([Apu_Rubro_Id]) REFERENCES [dbo].[Apu_Rubro] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

