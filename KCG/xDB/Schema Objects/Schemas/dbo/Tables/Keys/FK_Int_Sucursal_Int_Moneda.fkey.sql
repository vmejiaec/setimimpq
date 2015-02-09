ALTER TABLE [dbo].[Int_Sucursal]
    ADD CONSTRAINT [FK_Int_Sucursal_Int_Moneda] FOREIGN KEY ([Int_Moneda_Id]) REFERENCES [dbo].[Int_Moneda] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

