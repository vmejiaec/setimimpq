ALTER TABLE [dbo].[Apu_Presupuesto_Formula]
    ADD CONSTRAINT [FK_Apu_Presupuesto_Formula_Apu_Indice] FOREIGN KEY ([Apu_Indice_Id]) REFERENCES [dbo].[Apu_Indice] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

