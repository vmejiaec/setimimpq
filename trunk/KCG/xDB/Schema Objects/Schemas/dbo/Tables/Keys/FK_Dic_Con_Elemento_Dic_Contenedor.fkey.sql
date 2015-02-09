ALTER TABLE [dbo].[Dic_Con_Elemento]
    ADD CONSTRAINT [FK_Dic_Con_Elemento_Dic_Contenedor] FOREIGN KEY ([Dic_Contenedor_id]) REFERENCES [dbo].[Dic_Contenedor] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

