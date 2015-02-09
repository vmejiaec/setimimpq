ALTER TABLE [dbo].[Int_Usuario]
    ADD CONSTRAINT [FK_Int_Usuario_Seg_Rol] FOREIGN KEY ([Pred_Seg_Rol_id]) REFERENCES [dbo].[Seg_Rol] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

