ALTER TABLE [dbo].[Com_Contrato_DocTec]
    ADD CONSTRAINT [FK_Con_Contrato_DocTec_Con_Contrato] FOREIGN KEY ([Com_Contrato_Id]) REFERENCES [dbo].[Com_Contrato] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

