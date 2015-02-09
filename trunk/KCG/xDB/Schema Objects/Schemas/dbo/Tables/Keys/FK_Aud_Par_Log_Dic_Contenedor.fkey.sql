ALTER TABLE [dbo].[Aud_Par_Log]
    ADD CONSTRAINT [FK_Aud_Par_Log_Dic_Contenedor] FOREIGN KEY ([Dic_Contenedor_Id]) REFERENCES [dbo].[Dic_Contenedor] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

