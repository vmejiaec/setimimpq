ALTER TABLE [dbo].[Apu_Oferta_Rubro_Material]
    ADD CONSTRAINT [FK_Apu_Oferta_Rubro_Material_Apu_Material] FOREIGN KEY ([Apu_Material_Id]) REFERENCES [dbo].[Apu_Material] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

