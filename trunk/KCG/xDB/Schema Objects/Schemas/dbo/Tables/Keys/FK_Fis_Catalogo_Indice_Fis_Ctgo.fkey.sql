ALTER TABLE [dbo].[Fis_Catalogo_Indice]
    ADD CONSTRAINT [FK_Fis_Catalogo_Indice_Fis_Ctgo] FOREIGN KEY ([Fis_Catalogo_Id]) REFERENCES [dbo].[Fis_Catalogo] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

