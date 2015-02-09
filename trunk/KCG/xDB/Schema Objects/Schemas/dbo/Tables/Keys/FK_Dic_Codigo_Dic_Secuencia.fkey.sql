ALTER TABLE [dbo].[Dic_Codigo]
    ADD CONSTRAINT [FK_Dic_Codigo_Dic_Secuencia] FOREIGN KEY ([Dic_Secuencia_Id]) REFERENCES [dbo].[Dic_Secuencia] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

