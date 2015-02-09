ALTER TABLE [dbo].[Aud_Auditoria]
    ADD CONSTRAINT [FK_Aud_Auditoria_Int_Usuario] FOREIGN KEY ([Int_Usuario_Id]) REFERENCES [dbo].[Int_Usuario] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

