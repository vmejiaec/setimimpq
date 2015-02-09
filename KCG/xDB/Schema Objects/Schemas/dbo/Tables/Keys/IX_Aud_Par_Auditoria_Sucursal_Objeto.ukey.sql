﻿ALTER TABLE [dbo].[Aud_Par_Auditoria]
    ADD CONSTRAINT [IX_Aud_Par_Auditoria_Sucursal_Objeto] UNIQUE NONCLUSTERED ([Dic_Objeto_Id] ASC, [Int_Sucursal_Id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];
