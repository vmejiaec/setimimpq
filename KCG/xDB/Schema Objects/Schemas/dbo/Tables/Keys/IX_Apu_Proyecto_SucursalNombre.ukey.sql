﻿ALTER TABLE [dbo].[Apu_Proyecto]
    ADD CONSTRAINT [IX_Apu_Proyecto_SucursalNombre] UNIQUE NONCLUSTERED ([Nombre] ASC, [Int_Sucursal_Id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];
