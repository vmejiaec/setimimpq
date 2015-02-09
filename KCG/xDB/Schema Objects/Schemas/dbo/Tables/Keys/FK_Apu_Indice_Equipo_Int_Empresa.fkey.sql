ALTER TABLE [dbo].[Apu_Indice_Equipo]
    ADD CONSTRAINT [FK_Apu_Indice_Equipo_Int_Empresa] FOREIGN KEY ([Int_Empresa_Id]) REFERENCES [dbo].[Int_Empresa] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

