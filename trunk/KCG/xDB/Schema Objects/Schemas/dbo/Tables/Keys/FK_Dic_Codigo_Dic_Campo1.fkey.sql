ALTER TABLE [dbo].[Dic_Codigo]
    ADD CONSTRAINT [FK_Dic_Codigo_Dic_Campo1] FOREIGN KEY ([Act_Dic_Campo_id]) REFERENCES [dbo].[Dic_Campo] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

