ALTER TABLE [dbo].[Dic_Con_Objeto]
    ADD CONSTRAINT [FK_Dic_Con_Objeto_Dic_ContenedorVictor] FOREIGN KEY ([Dic_Contenedor_Id]) REFERENCES [dbo].[Dic_Contenedor] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

