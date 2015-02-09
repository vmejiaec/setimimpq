ALTER TABLE [dbo].[Seg_Rol_Elemento]
    ADD CONSTRAINT [FK_Seg_Rol_Elemento_Seg_Rol2] FOREIGN KEY ([Seg_Rol_Id]) REFERENCES [dbo].[Seg_Rol] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

