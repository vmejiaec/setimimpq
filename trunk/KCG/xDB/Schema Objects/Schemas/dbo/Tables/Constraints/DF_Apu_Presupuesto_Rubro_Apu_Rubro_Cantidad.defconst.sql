ALTER TABLE [dbo].[Apu_Presupuesto_Rubro]
    ADD CONSTRAINT [DF_Apu_Presupuesto_Rubro_Apu_Rubro_Cantidad] DEFAULT ((0)) FOR [Apu_Rubro_Cantidad];

