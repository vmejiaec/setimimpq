﻿ALTER TABLE [dbo].[Seg_Rol_Menu]
    ADD CONSTRAINT [FK_Seg_Rol_Menu_Dic_Con_Elemento] FOREIGN KEY ([Dic_Con_Elemento_Id]) REFERENCES [dbo].[Dic_Con_Elemento] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

