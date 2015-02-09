ALTER TABLE [dbo].[Apr_Doc_Estado]
    ADD CONSTRAINT [FK_Apr_Doc_Estado_Apr_Documento] FOREIGN KEY ([Apr_Documento_Id]) REFERENCES [dbo].[Apr_Documento] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

