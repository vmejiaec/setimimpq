﻿ALTER TABLE [dbo].[Apu_Oferta_Rubro_Equipo]
    ADD CONSTRAINT [IX_Apu_Oferta_Rubro_Equipo] UNIQUE NONCLUSTERED ([Codigo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];
