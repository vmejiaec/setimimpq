ALTER TABLE [dbo].[Apu_Mano_Obra]
    ADD CONSTRAINT [FK_Apu_Mano_Obra_Apu_Categoria] FOREIGN KEY ([Apu_Categoria_Id]) REFERENCES [dbo].[Apu_Categoria] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

