ALTER TABLE [dbo].[Ver_Doc_Estado]
    ADD CONSTRAINT [FK_Ver_Doc_Estado_Apr_Doc_Estado] FOREIGN KEY ([Apr_Doc_Estado_Id]) REFERENCES [dbo].[Apr_Doc_Estado] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

