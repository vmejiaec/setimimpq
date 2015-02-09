ALTER TABLE [dbo].[Apu_Proyecto_Material]
    ADD CONSTRAINT [FK_Apu_Proyecto_Material_Apu_Material] FOREIGN KEY ([Apu_Material_Id]) REFERENCES [dbo].[Apu_Material] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

