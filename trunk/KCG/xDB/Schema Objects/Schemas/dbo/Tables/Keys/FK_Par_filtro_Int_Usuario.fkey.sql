ALTER TABLE [dbo].[Par_Filtro]
    ADD CONSTRAINT [FK_Par_filtro_Int_Usuario] FOREIGN KEY ([int_usuario_id]) REFERENCES [dbo].[Int_Usuario] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

