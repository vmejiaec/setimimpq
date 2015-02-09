ALTER TABLE [dbo].[Par_Mensajeria]
    ADD CONSTRAINT [FK_Par_Mensajeria_Dic_Con_Objeto] FOREIGN KEY ([Dic_Con_Objeto_Id]) REFERENCES [dbo].[Dic_Con_Objeto] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

