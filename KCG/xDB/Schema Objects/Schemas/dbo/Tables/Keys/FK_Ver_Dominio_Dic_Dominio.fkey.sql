ALTER TABLE [dbo].[Ver_Dominio]
    ADD CONSTRAINT [FK_Ver_Dominio_Dic_Dominio] FOREIGN KEY ([Dic_Dominio_id]) REFERENCES [dbo].[Dic_Dominio] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

