ALTER TABLE [dbo].[Apu_Oferta_Categoria]
    ADD CONSTRAINT [FK_Apu_Oferta_Categoria_Apu_Categoria] FOREIGN KEY ([Apu_Categoria_Id]) REFERENCES [dbo].[Apu_Categoria] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

