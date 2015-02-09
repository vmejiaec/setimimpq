ALTER TABLE [dbo].[Fis_Planilla_Det]
    ADD CONSTRAINT [FK_Fis_Planilla_Det_Apu_Presupuesto_Rubro] FOREIGN KEY ([Apu_Prespuesto_Rubro_Id]) REFERENCES [dbo].[Apu_Presupuesto_Rubro] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

