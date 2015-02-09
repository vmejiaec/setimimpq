ALTER TABLE [dbo].[Seg_Rol_Usuario_Det]
    ADD CONSTRAINT [FK_Seg_Rol_Usuario_Det_Seg_Rol_Usuario] FOREIGN KEY ([Seg_Rol_Usuario_Id]) REFERENCES [dbo].[Seg_Rol_Usuario] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

