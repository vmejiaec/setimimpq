ALTER TABLE [dbo].[Apu_Presupuesto]
    ADD CONSTRAINT [FK_Apu_Presupuesto_Apu_Mano_Obra] FOREIGN KEY ([Apu_Mano_Obra_Id]) REFERENCES [dbo].[Apu_Mano_Obra] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

