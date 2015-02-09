ALTER TABLE [dbo].[Apu_Proyecto_Material]
    ADD CONSTRAINT [FK_Apu_Proyecto_Material_Apu_Indice] FOREIGN KEY ([Apu_Indice_Id]) REFERENCES [dbo].[Apu_Indice] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

