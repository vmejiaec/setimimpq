﻿ALTER TABLE [dbo].[Dic_Par_Paginacion]
    ADD CONSTRAINT [IX_Dic_Par_Paginacion] UNIQUE NONCLUSTERED ([Codigo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];

