ALTER TABLE [dbo].[Apu_Proyecto_Material]
    ADD CONSTRAINT [FK_Apu_Proyecto_Material_Apu_Proyecto] FOREIGN KEY ([Apu_Proyecto_Id]) REFERENCES [dbo].[Apu_Proyecto] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

