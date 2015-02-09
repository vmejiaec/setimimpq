ALTER TABLE [dbo].[Dic_Con_Elemento]
    ADD CONSTRAINT [FK_Dic_Con_Elemento_Dic_Rotulo1] FOREIGN KEY ([Tool_Dic_Rotulo_Id]) REFERENCES [dbo].[Dic_Rotulo] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

