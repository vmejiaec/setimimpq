ALTER TABLE [dbo].[Par_Razon_Social]
    ADD CONSTRAINT [FK_Par_Razon_Social_Par_Tipo_Identificacion] FOREIGN KEY ([Par_Tipo_Identificacion_Id]) REFERENCES [dbo].[Par_Tipo_Identificacion] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

