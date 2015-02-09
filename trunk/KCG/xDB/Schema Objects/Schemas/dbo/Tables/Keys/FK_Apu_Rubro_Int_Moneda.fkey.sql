ALTER TABLE [dbo].[Apu_Rubro]
    ADD CONSTRAINT [FK_Apu_Rubro_Int_Moneda] FOREIGN KEY ([Int_Moneda_Id]) REFERENCES [dbo].[Int_Moneda] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

