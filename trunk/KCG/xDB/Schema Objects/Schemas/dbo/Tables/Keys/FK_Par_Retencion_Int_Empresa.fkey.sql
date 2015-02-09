ALTER TABLE [dbo].[Par_Retencion]
    ADD CONSTRAINT [FK_Par_Retencion_Int_Empresa] FOREIGN KEY ([Int_Empresa_Id]) REFERENCES [dbo].[Int_Empresa] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

