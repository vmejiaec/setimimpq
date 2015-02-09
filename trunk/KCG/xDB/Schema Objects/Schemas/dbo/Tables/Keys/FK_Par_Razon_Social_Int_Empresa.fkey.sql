ALTER TABLE [dbo].[Par_Razon_Social]
    ADD CONSTRAINT [FK_Par_Razon_Social_Int_Empresa] FOREIGN KEY ([Int_Empresa_Id]) REFERENCES [dbo].[Int_Empresa] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

