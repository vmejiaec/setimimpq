﻿CREATE NONCLUSTERED INDEX [Indice_Apu_Proyecto_Equipo_Indice_Codigo]
    ON [dbo].[Apu_Proyecto_Equipo_Indice]([Codigo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, MAXDOP = 0)
    ON [PRIMARY];

