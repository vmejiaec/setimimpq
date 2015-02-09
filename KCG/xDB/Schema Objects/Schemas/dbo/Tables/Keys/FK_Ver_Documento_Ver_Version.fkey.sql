ALTER TABLE [dbo].[Ver_Documento]
    ADD CONSTRAINT [FK_Ver_Documento_Ver_Version] FOREIGN KEY ([Ver_Version_id]) REFERENCES [dbo].[Ver_Version] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

