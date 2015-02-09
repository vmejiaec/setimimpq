ALTER TABLE [dbo].[Com_Planilla_Pago]
    ADD CONSTRAINT [FK_Com_Planilla_Pago_Fis_Planilla] FOREIGN KEY ([Fis_Planilla_Id]) REFERENCES [dbo].[Fis_Planilla] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

