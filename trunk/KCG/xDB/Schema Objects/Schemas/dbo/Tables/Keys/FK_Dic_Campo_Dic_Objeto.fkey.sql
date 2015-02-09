ALTER TABLE [dbo].[Dic_Campo]
    ADD CONSTRAINT [FK_Dic_Campo_Dic_Objeto] FOREIGN KEY ([Dic_Objeto_Id]) REFERENCES [dbo].[Dic_Objeto] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

