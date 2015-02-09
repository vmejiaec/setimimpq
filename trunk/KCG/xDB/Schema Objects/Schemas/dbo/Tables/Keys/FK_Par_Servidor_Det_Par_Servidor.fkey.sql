ALTER TABLE [dbo].[Par_Servidor_Det]
    ADD CONSTRAINT [FK_Par_Servidor_Det_Par_Servidor] FOREIGN KEY ([Par_Servidor_Id]) REFERENCES [dbo].[Par_Servidor] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

