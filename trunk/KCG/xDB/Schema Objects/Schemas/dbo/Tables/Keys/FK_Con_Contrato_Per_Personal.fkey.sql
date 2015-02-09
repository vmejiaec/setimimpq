ALTER TABLE [dbo].[Com_Contrato]
    ADD CONSTRAINT [FK_Con_Contrato_Per_Personal] FOREIGN KEY ([Per_Personal_Resp_Exp]) REFERENCES [dbo].[Per_Personal] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

