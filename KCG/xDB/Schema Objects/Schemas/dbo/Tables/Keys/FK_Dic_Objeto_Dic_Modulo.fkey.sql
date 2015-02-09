ALTER TABLE [dbo].[Dic_Objeto]
    ADD CONSTRAINT [FK_Dic_Objeto_Dic_Modulo] FOREIGN KEY ([Dic_Modulo_Id]) REFERENCES [dbo].[Dic_Modulo] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

