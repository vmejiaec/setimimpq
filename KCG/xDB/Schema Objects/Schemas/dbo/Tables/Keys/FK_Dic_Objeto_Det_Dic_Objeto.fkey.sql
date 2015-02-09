ALTER TABLE [dbo].[Dic_Objeto_Det]
    ADD CONSTRAINT [FK_Dic_Objeto_Det_Dic_Objeto] FOREIGN KEY ([Id]) REFERENCES [dbo].[Dic_Objeto] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

