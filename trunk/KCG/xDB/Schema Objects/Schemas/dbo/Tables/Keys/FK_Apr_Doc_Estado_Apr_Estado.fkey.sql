ALTER TABLE [dbo].[Apr_Doc_Estado]
    ADD CONSTRAINT [FK_Apr_Doc_Estado_Apr_Estado] FOREIGN KEY ([Apr_Estado_Id]) REFERENCES [dbo].[Apr_Estado] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

