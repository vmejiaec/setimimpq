ALTER TABLE [dbo].[Apu_Material]
    ADD CONSTRAINT [FK_Apu_Material_Per_Personal] FOREIGN KEY ([Update_Per_Personal_Id]) REFERENCES [dbo].[Per_Personal] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

