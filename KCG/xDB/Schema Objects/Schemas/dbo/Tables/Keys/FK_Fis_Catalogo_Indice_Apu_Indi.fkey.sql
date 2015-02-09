ALTER TABLE [dbo].[Fis_Catalogo_Indice]
    ADD CONSTRAINT [FK_Fis_Catalogo_Indice_Apu_Indi] FOREIGN KEY ([Apu_Indice_Id]) REFERENCES [dbo].[Apu_Indice] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

