ALTER TABLE [dbo].[Apu_Parametros]
    ADD CONSTRAINT [FK_Apu_Parametros_Apu_Indice_Mano] FOREIGN KEY ([ManoObra_Apu_Indice_Id]) REFERENCES [dbo].[Apu_Indice] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

