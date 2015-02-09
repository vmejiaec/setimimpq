ALTER TABLE [dbo].[Dic_Paginacion]
    ADD CONSTRAINT [FK_Dic_Paginacion_Dic_Paginacion] FOREIGN KEY ([Id]) REFERENCES [dbo].[Dic_Paginacion] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

