﻿ALTER TABLE [dbo].[Apu_Oferta]
    ADD CONSTRAINT [IX_Apu_Oferta_Int_Sucursal_Nombre] UNIQUE NONCLUSTERED ([Int_Sucursal_Id] ASC, [Nombre] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];

