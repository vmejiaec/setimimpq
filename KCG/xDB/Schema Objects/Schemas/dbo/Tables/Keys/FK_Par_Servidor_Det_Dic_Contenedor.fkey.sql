ALTER TABLE [dbo].[Par_Servidor_Det]
    ADD CONSTRAINT [FK_Par_Servidor_Det_Dic_Contenedor] FOREIGN KEY ([Dic_Contenedor_Id]) REFERENCES [dbo].[Dic_Contenedor] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

