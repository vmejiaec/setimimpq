ALTER TABLE [dbo].[Apr_Documento]
    ADD CONSTRAINT [FK_Apr_Documento_Dic_Campo] FOREIGN KEY ([Dic_Campo_id]) REFERENCES [dbo].[Dic_Campo] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

