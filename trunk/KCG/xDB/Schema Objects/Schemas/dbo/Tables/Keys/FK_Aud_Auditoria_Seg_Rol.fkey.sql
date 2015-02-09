ALTER TABLE [dbo].[Aud_Auditoria]
    ADD CONSTRAINT [FK_Aud_Auditoria_Seg_Rol] FOREIGN KEY ([Seg_Rol_Id]) REFERENCES [dbo].[Seg_Rol] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

