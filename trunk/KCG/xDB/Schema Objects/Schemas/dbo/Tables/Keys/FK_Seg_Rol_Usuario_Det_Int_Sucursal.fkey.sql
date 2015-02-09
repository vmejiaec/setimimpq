ALTER TABLE [dbo].[Seg_Rol_Usuario_Det]
    ADD CONSTRAINT [FK_Seg_Rol_Usuario_Det_Int_Sucursal] FOREIGN KEY ([Int_Sucursal_Id]) REFERENCES [dbo].[Int_Sucursal] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

