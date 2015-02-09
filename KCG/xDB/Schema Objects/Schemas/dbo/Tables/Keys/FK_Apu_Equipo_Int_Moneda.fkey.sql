ALTER TABLE [dbo].[Apu_Equipo]
    ADD CONSTRAINT [FK_Apu_Equipo_Int_Moneda] FOREIGN KEY ([Int_Moneda_Id]) REFERENCES [dbo].[Int_Moneda] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

