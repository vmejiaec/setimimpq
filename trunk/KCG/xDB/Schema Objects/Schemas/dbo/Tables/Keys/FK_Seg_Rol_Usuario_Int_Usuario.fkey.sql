ALTER TABLE [dbo].[Seg_Rol_Usuario]
    ADD CONSTRAINT [FK_Seg_Rol_Usuario_Int_Usuario] FOREIGN KEY ([Int_Usuario_Id]) REFERENCES [dbo].[Int_Usuario] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

