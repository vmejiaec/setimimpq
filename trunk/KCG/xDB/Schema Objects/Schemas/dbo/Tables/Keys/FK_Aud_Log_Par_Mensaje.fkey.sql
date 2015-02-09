ALTER TABLE [dbo].[Aud_Log]
    ADD CONSTRAINT [FK_Aud_Log_Par_Mensaje] FOREIGN KEY ([Par_Mensaje_Id]) REFERENCES [dbo].[Par_Mensaje] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

