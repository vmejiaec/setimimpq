ALTER TABLE [dbo].[Com_Contrato]
    ADD CONSTRAINT [FK_Con_Contrato_Pla_Doc] FOREIGN KEY ([Pla_Doc_Id]) REFERENCES [dbo].[Pla_Doc] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

