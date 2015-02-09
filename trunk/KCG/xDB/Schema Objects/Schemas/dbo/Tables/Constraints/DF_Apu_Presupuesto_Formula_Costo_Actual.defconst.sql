ALTER TABLE [dbo].[Apu_Presupuesto_Formula]
    ADD CONSTRAINT [DF_Apu_Presupuesto_Formula_Costo_Actual] DEFAULT ((0)) FOR [Costo_Actual];

