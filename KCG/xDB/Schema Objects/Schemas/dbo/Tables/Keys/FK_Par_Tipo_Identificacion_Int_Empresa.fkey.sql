ALTER TABLE [dbo].[Par_Tipo_Identificacion]
    ADD CONSTRAINT [FK_Par_Tipo_Identificacion_Int_Empresa] FOREIGN KEY ([Int_Empresa_Id]) REFERENCES [dbo].[Int_Empresa] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

