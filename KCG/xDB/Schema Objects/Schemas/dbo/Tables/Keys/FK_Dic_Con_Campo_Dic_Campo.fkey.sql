ALTER TABLE [dbo].[Dic_Con_Campo]
    ADD CONSTRAINT [FK_Dic_Con_Campo_Dic_Campo] FOREIGN KEY ([Dic_Campo_Id]) REFERENCES [dbo].[Dic_Campo] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

