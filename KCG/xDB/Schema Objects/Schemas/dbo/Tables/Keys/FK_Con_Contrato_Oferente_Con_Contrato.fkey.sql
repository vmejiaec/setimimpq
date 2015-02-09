ALTER TABLE [dbo].[Com_Contrato_Oferente]
    ADD CONSTRAINT [FK_Con_Contrato_Oferente_Con_Contrato] FOREIGN KEY ([Com_Contrato_Id]) REFERENCES [dbo].[Com_Contrato] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

