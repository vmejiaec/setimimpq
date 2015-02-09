ALTER TABLE [dbo].[Apu_Oferta]
    ADD CONSTRAINT [FK_Apu_Oferta_Per_Personal2] FOREIGN KEY ([Tecnico_Per_Personal_Id]) REFERENCES [dbo].[Per_Personal] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

