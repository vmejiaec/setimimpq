ALTER TABLE [dbo].[Dic_Con_Elemento]
    ADD CONSTRAINT [FK_Dic_Con_Elemento_Dic_Rotulo] FOREIGN KEY ([Dic_Rotulo_id]) REFERENCES [dbo].[Dic_Rotulo] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

