ALTER TABLE [dbo].[Seg_Rol_Objeto]
    ADD CONSTRAINT [FK_Seg_Rol_Objeto_Dic_Con_Objeto] FOREIGN KEY ([Dic_Con_Objeto_Id]) REFERENCES [dbo].[Dic_Con_Objeto] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

