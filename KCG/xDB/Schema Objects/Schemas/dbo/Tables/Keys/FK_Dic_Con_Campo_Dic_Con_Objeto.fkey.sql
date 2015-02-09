ALTER TABLE [dbo].[Dic_Con_Campo]
    ADD CONSTRAINT [FK_Dic_Con_Campo_Dic_Con_Objeto] FOREIGN KEY ([Dic_Con_Objeto_Id]) REFERENCES [dbo].[Dic_Con_Objeto] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

