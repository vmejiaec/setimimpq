﻿ALTER TABLE [dbo].[Apu_Proyecto_Material]
    ADD CONSTRAINT [IX_Apu_Proyecto_Material] UNIQUE NONCLUSTERED ([Codigo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];

