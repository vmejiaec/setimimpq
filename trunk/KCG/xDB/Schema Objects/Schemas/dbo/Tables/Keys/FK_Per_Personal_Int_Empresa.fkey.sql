ALTER TABLE [dbo].[Per_Personal]
    ADD CONSTRAINT [FK_Per_Personal_Int_Empresa] FOREIGN KEY ([Int_Empresa_Id]) REFERENCES [dbo].[Int_Empresa] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

