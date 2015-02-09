ALTER TABLE [dbo].[Apu_Oferta_Rubro_Equipo]
    ADD CONSTRAINT [FK_Apu_Oferta_Rubro_Equipo_Per_Personal1] FOREIGN KEY ([Update_Per_Personal_Id]) REFERENCES [dbo].[Per_Personal] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

