﻿ALTER TABLE [dbo].[Dic_Rotulo]
    ADD CONSTRAINT [IX_Dic_Rotulo_Nombre] UNIQUE NONCLUSTERED ([Nombre] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];
