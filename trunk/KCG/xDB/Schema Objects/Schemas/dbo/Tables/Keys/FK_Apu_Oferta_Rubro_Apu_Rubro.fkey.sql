ALTER TABLE [dbo].[Apu_Oferta_Rubro]
    ADD CONSTRAINT [FK_Apu_Oferta_Rubro_Apu_Rubro] FOREIGN KEY ([Apu_Rubro_Id]) REFERENCES [dbo].[Apu_Rubro] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

