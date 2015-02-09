ALTER TABLE [dbo].[Apu_Presupuesto]
    ADD CONSTRAINT [DF_Apu_Presupuesto_Costo_Directo] DEFAULT ((0)) FOR [Costo_Directo];

