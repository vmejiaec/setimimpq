ALTER TABLE [dbo].[Fis_Catalogo_Mano_Obra]
    ADD CONSTRAINT [FK_Fis_Catalogo_M_Obra_Apu_Categ] FOREIGN KEY ([Apu_Categoria_Id]) REFERENCES [dbo].[Apu_Categoria] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

