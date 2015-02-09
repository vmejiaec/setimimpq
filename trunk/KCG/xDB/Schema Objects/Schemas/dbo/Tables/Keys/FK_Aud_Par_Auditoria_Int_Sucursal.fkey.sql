ALTER TABLE [dbo].[Aud_Par_Auditoria]
    ADD CONSTRAINT [FK_Aud_Par_Auditoria_Int_Sucursal] FOREIGN KEY ([Int_Sucursal_Id]) REFERENCES [dbo].[Int_Sucursal] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

