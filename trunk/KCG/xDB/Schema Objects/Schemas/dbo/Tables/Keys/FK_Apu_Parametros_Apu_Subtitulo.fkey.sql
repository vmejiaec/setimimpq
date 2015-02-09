ALTER TABLE [dbo].[Apu_Parametros]
    ADD CONSTRAINT [FK_Apu_Parametros_Apu_Subtitulo] FOREIGN KEY ([Apu_Subtitulo_Id_Oferta_Rubro_Pred]) REFERENCES [dbo].[Apu_Subtitulo] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

