ALTER TABLE [dbo].[Com_Contrato_Oferente]
    ADD CONSTRAINT [FK_Con_Contrato_Oferente_Per_Personal] FOREIGN KEY ([Per_Personal_Id_Recibe]) REFERENCES [dbo].[Per_Personal] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

