ALTER TABLE [dbo].[Apu_Oferta_Categoria]
    ADD CONSTRAINT [FK_Apu_Oferta_Categoria_Apu_Oferta_Categoria] FOREIGN KEY ([Id]) REFERENCES [dbo].[Apu_Oferta_Categoria] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

