ALTER TABLE [dbo].[Seg_Rol_Elemento]
    ADD CONSTRAINT [FK_Seg_Rol_Elemento_Dic_Con_Elemento] FOREIGN KEY ([Dic_Con_Elemento_Id]) REFERENCES [dbo].[Dic_Con_Elemento] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

