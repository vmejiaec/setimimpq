﻿ALTER TABLE [dbo].[Com_Contrato_Tipo_Marca]
    ADD CONSTRAINT [FK_Com_Contrato_Tipo_Marca_Com_Contrato_Tipo] FOREIGN KEY ([Com_Contrato_Tipo_Id]) REFERENCES [dbo].[Com_Contrato_Tipo] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

