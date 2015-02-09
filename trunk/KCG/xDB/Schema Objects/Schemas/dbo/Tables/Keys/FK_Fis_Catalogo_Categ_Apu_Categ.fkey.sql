ALTER TABLE [dbo].[Fis_Catalogo_Categoria]
    ADD CONSTRAINT [FK_Fis_Catalogo_Categ_Apu_Categ] FOREIGN KEY ([Apu_Categoria_Id]) REFERENCES [dbo].[Apu_Categoria] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

