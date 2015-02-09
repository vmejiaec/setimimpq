ALTER TABLE [dbo].[Apu_Presupuesto_Indice]
    ADD CONSTRAINT [DF_Apu_Presupuesto_Indice_Costo_Indice] DEFAULT ((0)) FOR [Costo_Indice];

