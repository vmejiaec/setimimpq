ALTER TABLE [dbo].[Dic_Contenedor]
    ADD CONSTRAINT [FK_Dic_Contenedor_Dic_Modulo] FOREIGN KEY ([Dic_Modulo_id]) REFERENCES [dbo].[Dic_Modulo] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

