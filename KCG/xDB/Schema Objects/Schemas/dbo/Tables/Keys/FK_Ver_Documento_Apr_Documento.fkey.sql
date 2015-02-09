ALTER TABLE [dbo].[Ver_Documento]
    ADD CONSTRAINT [FK_Ver_Documento_Apr_Documento] FOREIGN KEY ([Apr_Documento_Id]) REFERENCES [dbo].[Apr_Documento] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

