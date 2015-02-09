ALTER TABLE [dbo].[Apu_Proyecto]
    ADD CONSTRAINT [FK_Apu_Proyecto_Apu_Lugar] FOREIGN KEY ([Apu_Lugar_Id]) REFERENCES [dbo].[Apu_Lugar] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

