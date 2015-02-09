ALTER TABLE [dbo].[Pla_Lote]
    ADD CONSTRAINT [FK_Pla_Lote_Pla_Lote_Tipo] FOREIGN KEY ([Pla_Lote_Tipo_Id]) REFERENCES [dbo].[Pla_Lote_Tipo] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

