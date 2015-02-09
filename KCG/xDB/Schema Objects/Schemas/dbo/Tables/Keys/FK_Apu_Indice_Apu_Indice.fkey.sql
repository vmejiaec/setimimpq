ALTER TABLE [dbo].[Apu_Indice]
    ADD CONSTRAINT [FK_Apu_Indice_Apu_Indice] FOREIGN KEY ([Id]) REFERENCES [dbo].[Apu_Indice] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

