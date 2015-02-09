ALTER TABLE [dbo].[Apu_Oferta_Rubro_Mano_Obra]
    ADD CONSTRAINT [FK_Apu_Oferta_Rubro_Mano_Obra_Apu_Oferta_Rubro] FOREIGN KEY ([Apu_Oferta_Rubro_Id]) REFERENCES [dbo].[Apu_Oferta_Rubro] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

