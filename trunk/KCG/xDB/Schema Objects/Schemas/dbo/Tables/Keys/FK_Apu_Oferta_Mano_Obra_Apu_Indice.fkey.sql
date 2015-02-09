ALTER TABLE [dbo].[Apu_Oferta_Mano_Obra]
    ADD CONSTRAINT [FK_Apu_Oferta_Mano_Obra_Apu_Indice] FOREIGN KEY ([Apu_Indice_Id]) REFERENCES [dbo].[Apu_Indice] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

