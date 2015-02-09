ALTER TABLE [dbo].[Ver_Doc_Estado]
    ADD CONSTRAINT [FK_Ver_Doc_Estado_Ver_Version] FOREIGN KEY ([Ver_Version_Id]) REFERENCES [dbo].[Ver_Version] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

