ALTER TABLE [dbo].[Aud_Par_Log]
    ADD CONSTRAINT [FK_Aud_Par_Log_Int_Sucursal] FOREIGN KEY ([Int_Sucursal_Id]) REFERENCES [dbo].[Int_Sucursal] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

