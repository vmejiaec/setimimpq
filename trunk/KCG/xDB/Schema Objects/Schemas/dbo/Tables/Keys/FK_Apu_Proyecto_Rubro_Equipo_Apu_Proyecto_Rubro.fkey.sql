ALTER TABLE [dbo].[Apu_Proyecto_Rubro_Equipo]
    ADD CONSTRAINT [FK_Apu_Proyecto_Rubro_Equipo_Apu_Proyecto_Rubro] FOREIGN KEY ([Apu_Proyecto_Rubro_Id]) REFERENCES [dbo].[Apu_Proyecto_Rubro] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

