ALTER TABLE [dbo].[Com_Contrato]
    ADD CONSTRAINT [FK_Con_Contrato_Par_Razon_Social_Id_Contratista] FOREIGN KEY ([Par_Razon_Social_Id_Contratista]) REFERENCES [dbo].[Par_Razon_Social] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

