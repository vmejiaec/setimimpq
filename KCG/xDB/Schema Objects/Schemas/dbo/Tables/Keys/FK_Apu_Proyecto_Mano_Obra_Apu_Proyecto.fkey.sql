ALTER TABLE [dbo].[Apu_Proyecto_Mano_Obra]
    ADD CONSTRAINT [FK_Apu_Proyecto_Mano_Obra_Apu_Proyecto] FOREIGN KEY ([Apu_Proyecto_Id]) REFERENCES [dbo].[Apu_Proyecto] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

