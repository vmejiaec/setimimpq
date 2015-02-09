ALTER TABLE [dbo].[Com_Contrato]
    ADD CONSTRAINT [FK_Con_Contrato_Per_Personal1] FOREIGN KEY ([Per_Personal_Id_Admin]) REFERENCES [dbo].[Per_Personal] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

