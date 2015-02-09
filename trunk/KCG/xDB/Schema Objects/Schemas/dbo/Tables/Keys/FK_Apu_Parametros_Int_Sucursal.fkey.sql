ALTER TABLE [dbo].[Apu_Parametros]
    ADD CONSTRAINT [FK_Apu_Parametros_Int_Sucursal] FOREIGN KEY ([Int_Sucursal_Id]) REFERENCES [dbo].[Int_Sucursal] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

