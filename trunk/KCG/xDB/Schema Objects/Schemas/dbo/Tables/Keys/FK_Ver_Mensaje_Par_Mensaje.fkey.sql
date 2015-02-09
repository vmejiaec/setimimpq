ALTER TABLE [dbo].[Ver_Mensaje]
    ADD CONSTRAINT [FK_Ver_Mensaje_Par_Mensaje] FOREIGN KEY ([Par_Mensaje_Id]) REFERENCES [dbo].[Par_Mensaje] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

