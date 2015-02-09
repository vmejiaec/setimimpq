ALTER TABLE [dbo].[Com_Contrato]
    ADD CONSTRAINT [FK_Con_Contrato_Con_Procedimiento] FOREIGN KEY ([Com_Procedimiento_Id]) REFERENCES [dbo].[Com_Procedimiento] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

