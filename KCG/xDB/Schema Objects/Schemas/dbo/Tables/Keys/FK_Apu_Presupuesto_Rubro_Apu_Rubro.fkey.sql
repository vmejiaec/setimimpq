ALTER TABLE [dbo].[Apu_Presupuesto_Rubro]
    ADD CONSTRAINT [FK_Apu_Presupuesto_Rubro_Apu_Rubro] FOREIGN KEY ([Apu_Rubro_id]) REFERENCES [dbo].[Apu_Rubro] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

