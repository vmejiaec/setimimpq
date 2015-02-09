ALTER TABLE [dbo].[Apu_Presupuesto_Cuadrilla]
    ADD CONSTRAINT [DF_Apu_Presupuesto_Cuadrilla_Numero_Trabajadores] DEFAULT ((0)) FOR [Numero_Trabajadores];

