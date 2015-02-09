ALTER TABLE [dbo].[Fis_Planilla_Det]
    ADD CONSTRAINT [FK_Fis_Planilla_Det_Fis_Planilla] FOREIGN KEY ([Fis_Planilla_Id]) REFERENCES [dbo].[Fis_Planilla] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

