ALTER TABLE [dbo].[Dic_General]
    ADD CONSTRAINT [FK_Dic_General_Dic_Rotulo1] FOREIGN KEY ([Tool_Dic_Rotulo_id]) REFERENCES [dbo].[Dic_Rotulo] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

