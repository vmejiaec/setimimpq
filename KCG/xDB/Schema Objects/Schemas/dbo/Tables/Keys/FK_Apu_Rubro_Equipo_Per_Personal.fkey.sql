ALTER TABLE [dbo].[Apu_Rubro_Equipo]
    ADD CONSTRAINT [FK_Apu_Rubro_Equipo_Per_Personal] FOREIGN KEY ([Creacion_Per_Personal_Id]) REFERENCES [dbo].[Per_Personal] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

