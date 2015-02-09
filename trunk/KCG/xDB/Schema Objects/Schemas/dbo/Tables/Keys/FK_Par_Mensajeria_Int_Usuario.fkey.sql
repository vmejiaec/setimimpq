ALTER TABLE [dbo].[Par_Mensajeria]
    ADD CONSTRAINT [FK_Par_Mensajeria_Int_Usuario] FOREIGN KEY ([Int_Usuario_Id]) REFERENCES [dbo].[Int_Usuario] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

