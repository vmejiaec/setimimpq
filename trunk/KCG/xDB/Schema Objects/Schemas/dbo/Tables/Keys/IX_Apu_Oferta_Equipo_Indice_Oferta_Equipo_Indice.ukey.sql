ALTER TABLE [dbo].[Apu_Oferta_Equipo_Indice]
    ADD CONSTRAINT [IX_Apu_Oferta_Equipo_Indice_Oferta_Equipo_Indice] UNIQUE NONCLUSTERED ([Apu_Indice_Id] ASC, [Apu_Oferta_Equipo_Id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];

