﻿ALTER TABLE [dbo].[Dic_Con_Campo]
    ADD CONSTRAINT [IX_Dic_Con_Campo_Dic_Cont_Obj_Campo] UNIQUE NONCLUSTERED ([Dic_Con_Objeto_Id] ASC, [Dic_Campo_Id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];
