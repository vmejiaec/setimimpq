ALTER TABLE [dbo].[Apu_Proyecto_Categoria]
    ADD CONSTRAINT [FK_Apu_Proyecto_Categoria_Apu_Proyecto_Categoria] FOREIGN KEY ([Id]) REFERENCES [dbo].[Apu_Proyecto_Categoria] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

