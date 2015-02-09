ALTER TABLE [dbo].[Dic_Con_Objeto]
    ADD CONSTRAINT [FK_Dic_Con_Objeto_Dic_ObjetoVictor] FOREIGN KEY ([Dic_Objeto_Id]) REFERENCES [dbo].[Dic_Objeto] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

