ALTER TABLE [dbo].[Fis_Catalogo]
    ADD CONSTRAINT [FK_Fis_Catalogo_Int_Empresa] FOREIGN KEY ([Int_Empresa_Id]) REFERENCES [dbo].[Int_Empresa] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

