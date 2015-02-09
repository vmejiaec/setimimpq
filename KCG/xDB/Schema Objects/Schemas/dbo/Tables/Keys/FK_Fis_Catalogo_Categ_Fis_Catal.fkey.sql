ALTER TABLE [dbo].[Fis_Catalogo_Categoria]
    ADD CONSTRAINT [FK_Fis_Catalogo_Categ_Fis_Catal] FOREIGN KEY ([Fis_Catalogo_Id]) REFERENCES [dbo].[Fis_Catalogo] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

