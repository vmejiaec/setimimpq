ALTER TABLE [dbo].[Seg_Rol_Objeto]
    ADD CONSTRAINT [FK_Seg_Rol_Objeto_Seg_Rol] FOREIGN KEY ([Seg_Rol_Id]) REFERENCES [dbo].[Seg_Rol] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

