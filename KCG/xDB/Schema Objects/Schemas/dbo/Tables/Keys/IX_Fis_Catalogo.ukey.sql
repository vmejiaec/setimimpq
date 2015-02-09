﻿ALTER TABLE [dbo].[Fis_Catalogo]
    ADD CONSTRAINT [IX_Fis_Catalogo] UNIQUE NONCLUSTERED ([Fecha_Publicacion] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];
