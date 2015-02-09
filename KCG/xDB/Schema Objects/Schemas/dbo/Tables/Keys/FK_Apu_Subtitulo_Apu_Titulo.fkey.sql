ALTER TABLE [dbo].[Apu_Subtitulo]
    ADD CONSTRAINT [FK_Apu_Subtitulo_Apu_Titulo] FOREIGN KEY ([Apu_Titulo_Id]) REFERENCES [dbo].[Apu_Titulo] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

