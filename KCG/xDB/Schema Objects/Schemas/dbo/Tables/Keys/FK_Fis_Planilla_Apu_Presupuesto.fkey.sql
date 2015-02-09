ALTER TABLE [dbo].[Fis_Planilla]
    ADD CONSTRAINT [FK_Fis_Planilla_Apu_Presupuesto] FOREIGN KEY ([Apu_Presupuesto_Id]) REFERENCES [dbo].[Apu_Presupuesto] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

