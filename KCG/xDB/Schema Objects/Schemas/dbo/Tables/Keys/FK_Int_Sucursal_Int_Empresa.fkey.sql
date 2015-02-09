ALTER TABLE [dbo].[Int_Sucursal]
    ADD CONSTRAINT [FK_Int_Sucursal_Int_Empresa] FOREIGN KEY ([Int_Empresa_Id]) REFERENCES [dbo].[Int_Empresa] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

