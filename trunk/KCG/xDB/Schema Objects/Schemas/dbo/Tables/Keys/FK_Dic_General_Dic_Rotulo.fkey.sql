ALTER TABLE [dbo].[Dic_General]
    ADD CONSTRAINT [FK_Dic_General_Dic_Rotulo] FOREIGN KEY ([Dic_Rotulo_Id]) REFERENCES [dbo].[Dic_Rotulo] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

