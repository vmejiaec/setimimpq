ALTER TABLE [dbo].[Ver_Etiqueta]
    ADD CONSTRAINT [FK_Ver_Etiqueta_Dic_Rotulo] FOREIGN KEY ([Dic_Rotulo_Id]) REFERENCES [dbo].[Dic_Rotulo] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

