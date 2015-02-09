ALTER TABLE [dbo].[Apu_Proyecto_Transporte_Indice]
    ADD CONSTRAINT [IX_Apu_Proyecto_Transporte_Indice_Proyecto_Indice] UNIQUE NONCLUSTERED ([Apu_Proyecto_Id] ASC, [Apu_Indice_Id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];

