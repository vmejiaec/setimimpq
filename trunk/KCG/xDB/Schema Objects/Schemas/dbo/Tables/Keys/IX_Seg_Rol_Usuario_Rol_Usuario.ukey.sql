﻿ALTER TABLE [dbo].[Seg_Rol_Usuario]
    ADD CONSTRAINT [IX_Seg_Rol_Usuario_Rol_Usuario] UNIQUE NONCLUSTERED ([Int_Usuario_Id] ASC, [Seg_Rol_Id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];

