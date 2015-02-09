ALTER TABLE [dbo].[Apu_Presupuesto_Indice]
    ADD CONSTRAINT [DF_Apu_Presupuesto_Indice_Costo_Total] DEFAULT ((0)) FOR [Costo_Total];

