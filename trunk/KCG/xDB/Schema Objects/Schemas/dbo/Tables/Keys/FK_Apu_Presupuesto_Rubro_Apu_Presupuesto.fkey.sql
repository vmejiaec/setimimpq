ALTER TABLE [dbo].[Apu_Presupuesto_Rubro]
    ADD CONSTRAINT [FK_Apu_Presupuesto_Rubro_Apu_Presupuesto] FOREIGN KEY ([Apu_Presupuesto_Id]) REFERENCES [dbo].[Apu_Presupuesto] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

