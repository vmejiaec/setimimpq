﻿ALTER TABLE [dbo].[Par_Tipo_Identificacion]
    ADD CONSTRAINT [IX_Par_Tipo_Identificacion_Codigo] UNIQUE NONCLUSTERED ([Codigo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];

