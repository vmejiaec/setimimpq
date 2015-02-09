ALTER TABLE [dbo].[Dic_Pantalla]
    ADD CONSTRAINT [FK_Dic_Pantalla_Dic_Rotulo] FOREIGN KEY ([Dic_Rotulo_Id]) REFERENCES [dbo].[Dic_Rotulo] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

