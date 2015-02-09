ALTER TABLE [dbo].[Apu_Presupuesto_Cuadrilla]
    ADD CONSTRAINT [DF_Apu_Presupuesto_Cuadrilla_Costo_Total] DEFAULT ((0)) FOR [Costo_Total];

