﻿ALTER TABLE [dbo].[Fis_Catalogo_Categoria]
    ADD CONSTRAINT [IX_Fis_Catalogo_Categoria_Cod] UNIQUE NONCLUSTERED ([Codigo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];

