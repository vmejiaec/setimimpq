ALTER TABLE [dbo].[Int_Usuario]
    ADD CONSTRAINT [FK_Int_Usuario_Int_Sucursal] FOREIGN KEY ([Pred_Int_Sucursal_id]) REFERENCES [dbo].[Int_Sucursal] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

