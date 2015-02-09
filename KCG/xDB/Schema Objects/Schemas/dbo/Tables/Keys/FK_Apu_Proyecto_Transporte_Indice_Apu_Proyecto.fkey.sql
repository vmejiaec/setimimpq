ALTER TABLE [dbo].[Apu_Proyecto_Transporte_Indice]
    ADD CONSTRAINT [FK_Apu_Proyecto_Transporte_Indice_Apu_Proyecto] FOREIGN KEY ([Apu_Proyecto_Id]) REFERENCES [dbo].[Apu_Proyecto] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

