﻿ALTER TABLE [dbo].[Apu_Categoria]
    ADD CONSTRAINT [IX_Apu_Categoria_Nombre_Empresa_Id] UNIQUE NONCLUSTERED ([Nombre] ASC, [Int_Empresa_Id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];
