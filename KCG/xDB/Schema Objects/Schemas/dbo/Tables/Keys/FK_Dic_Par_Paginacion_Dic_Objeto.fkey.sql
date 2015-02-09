ALTER TABLE [dbo].[Dic_Par_Paginacion]
    ADD CONSTRAINT [FK_Dic_Par_Paginacion_Dic_Objeto] FOREIGN KEY ([Dic_Objeto_Id]) REFERENCES [dbo].[Dic_Objeto] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

