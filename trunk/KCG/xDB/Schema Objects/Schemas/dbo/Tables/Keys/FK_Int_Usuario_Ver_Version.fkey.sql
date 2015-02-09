ALTER TABLE [dbo].[Int_Usuario]
    ADD CONSTRAINT [FK_Int_Usuario_Ver_Version] FOREIGN KEY ([Pred_Ver_Version_id]) REFERENCES [dbo].[Ver_Version] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

