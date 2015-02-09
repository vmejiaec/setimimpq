ALTER TABLE [dbo].[Fis_Catalogo]
    ADD CONSTRAINT [FK_Fis_Catalogo_Per_Personal_Id] FOREIGN KEY ([Creacion_Per_Personal_Id]) REFERENCES [dbo].[Per_Personal] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

