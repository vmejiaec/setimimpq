ALTER TABLE [dbo].[Dic_Con_Campo]
    ADD CONSTRAINT [FK_Dic_Con_Campo_Dic_Rotulo] FOREIGN KEY ([Dic_Rotulo_Id]) REFERENCES [dbo].[Dic_Rotulo] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

