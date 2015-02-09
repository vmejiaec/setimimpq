ALTER TABLE [dbo].[Dic_Dominio]
    ADD CONSTRAINT [FK_Dic_Dominio_Dic_Campo] FOREIGN KEY ([Dic_Campo_Id]) REFERENCES [dbo].[Dic_Campo] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

