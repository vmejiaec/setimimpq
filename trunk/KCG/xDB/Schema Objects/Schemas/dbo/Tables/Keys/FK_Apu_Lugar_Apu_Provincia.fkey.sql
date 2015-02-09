ALTER TABLE [dbo].[Apu_Lugar]
    ADD CONSTRAINT [FK_Apu_Lugar_Apu_Provincia] FOREIGN KEY ([Apu_Provincia_Id]) REFERENCES [dbo].[Apu_Provincia] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

