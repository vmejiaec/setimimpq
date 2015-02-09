ALTER TABLE [dbo].[Pla_PersonalDatos]
    ADD CONSTRAINT [FK_Pla_PersonalDatos_Per_Personal] FOREIGN KEY ([Per_Personal_Id]) REFERENCES [dbo].[Per_Personal] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

