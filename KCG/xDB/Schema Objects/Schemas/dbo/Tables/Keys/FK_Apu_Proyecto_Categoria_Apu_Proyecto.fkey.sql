ALTER TABLE [dbo].[Apu_Proyecto_Categoria]
    ADD CONSTRAINT [FK_Apu_Proyecto_Categoria_Apu_Proyecto] FOREIGN KEY ([Apu_Proyecto_Id]) REFERENCES [dbo].[Apu_Proyecto] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

