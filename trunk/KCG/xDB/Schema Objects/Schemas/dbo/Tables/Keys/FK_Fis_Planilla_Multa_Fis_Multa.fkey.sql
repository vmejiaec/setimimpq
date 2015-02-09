ALTER TABLE [dbo].[Fis_Planilla_Multa]
    ADD CONSTRAINT [FK_Fis_Planilla_Multa_Fis_Multa] FOREIGN KEY ([Fis_Multa_Id]) REFERENCES [dbo].[Fis_Multa] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

