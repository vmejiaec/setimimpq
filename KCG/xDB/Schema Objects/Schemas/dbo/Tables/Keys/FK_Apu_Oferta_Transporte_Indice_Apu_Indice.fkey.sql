ALTER TABLE [dbo].[Apu_Oferta_Transporte_Indice]
    ADD CONSTRAINT [FK_Apu_Oferta_Transporte_Indice_Apu_Indice] FOREIGN KEY ([Apu_Indice_Id]) REFERENCES [dbo].[Apu_Indice] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

