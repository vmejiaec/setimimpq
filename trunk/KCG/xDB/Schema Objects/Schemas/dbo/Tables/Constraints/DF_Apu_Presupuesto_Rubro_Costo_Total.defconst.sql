ALTER TABLE [dbo].[Apu_Presupuesto_Rubro]
    ADD CONSTRAINT [DF_Apu_Presupuesto_Rubro_Costo_Total] DEFAULT ((0)) FOR [Costo_Total];

