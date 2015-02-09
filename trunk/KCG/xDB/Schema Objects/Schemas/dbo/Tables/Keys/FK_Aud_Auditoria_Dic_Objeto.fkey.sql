ALTER TABLE [dbo].[Aud_Auditoria]
    ADD CONSTRAINT [FK_Aud_Auditoria_Dic_Objeto] FOREIGN KEY ([Dic_Objeto_Id]) REFERENCES [dbo].[Dic_Objeto] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

