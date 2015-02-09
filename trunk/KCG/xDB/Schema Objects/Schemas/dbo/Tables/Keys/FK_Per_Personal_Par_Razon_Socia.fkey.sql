ALTER TABLE [dbo].[Per_Personal]
    ADD CONSTRAINT [FK_Per_Personal_Par_Razon_Socia] FOREIGN KEY ([Par_Razon_Social_Id]) REFERENCES [dbo].[Par_Razon_Social] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

