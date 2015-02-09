ALTER TABLE [dbo].[Int_Usuario]
    ADD CONSTRAINT [FK_Int_Usuario_Per_Personal] FOREIGN KEY ([Per_Personal_Id]) REFERENCES [dbo].[Per_Personal] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

