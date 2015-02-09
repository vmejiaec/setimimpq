ALTER TABLE [dbo].[Com_Contrato_Legal]
    ADD CONSTRAINT [FK_Com_Contrato_Legal_Com_Contrato] FOREIGN KEY ([Com_Contrato_Id]) REFERENCES [dbo].[Com_Contrato] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

