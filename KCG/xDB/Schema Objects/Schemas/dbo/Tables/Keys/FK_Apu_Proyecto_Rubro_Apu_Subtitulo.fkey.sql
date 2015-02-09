ALTER TABLE [dbo].[Apu_Proyecto_Rubro]
    ADD CONSTRAINT [FK_Apu_Proyecto_Rubro_Apu_Subtitulo] FOREIGN KEY ([Apu_Subtitulo_Id]) REFERENCES [dbo].[Apu_Subtitulo] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

