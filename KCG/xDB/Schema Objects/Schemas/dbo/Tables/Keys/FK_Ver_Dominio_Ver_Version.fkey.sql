ALTER TABLE [dbo].[Ver_Dominio]
    ADD CONSTRAINT [FK_Ver_Dominio_Ver_Version] FOREIGN KEY ([Ver_Version_id]) REFERENCES [dbo].[Ver_Version] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

