ALTER TABLE [dbo].[Aud_Log]
    ADD CONSTRAINT [FK_Aud_Log_Ver_Version] FOREIGN KEY ([Ver_Version_Id]) REFERENCES [dbo].[Ver_Version] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

