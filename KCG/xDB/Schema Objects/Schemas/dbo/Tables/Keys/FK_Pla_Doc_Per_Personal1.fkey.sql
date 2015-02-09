ALTER TABLE [dbo].[Pla_Doc]
    ADD CONSTRAINT [FK_Pla_Doc_Per_Personal1] FOREIGN KEY ([Per_Personal_Id_Crea]) REFERENCES [dbo].[Per_Personal] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

