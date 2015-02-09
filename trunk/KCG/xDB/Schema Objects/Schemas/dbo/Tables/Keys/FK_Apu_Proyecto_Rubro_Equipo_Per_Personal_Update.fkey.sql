ALTER TABLE [dbo].[Apu_Proyecto_Rubro_Equipo]
    ADD CONSTRAINT [FK_Apu_Proyecto_Rubro_Equipo_Per_Personal_Update] FOREIGN KEY ([Update_Per_Personal_Id]) REFERENCES [dbo].[Per_Personal] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

