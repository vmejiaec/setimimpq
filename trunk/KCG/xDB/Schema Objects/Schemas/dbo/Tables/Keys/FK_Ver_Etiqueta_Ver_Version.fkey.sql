ALTER TABLE [dbo].[Ver_Etiqueta]
    ADD CONSTRAINT [FK_Ver_Etiqueta_Ver_Version] FOREIGN KEY ([Ver_Version_Id]) REFERENCES [dbo].[Ver_Version] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

