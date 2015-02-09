ALTER TABLE [dbo].[Pla_Poa]
    ADD CONSTRAINT [FK_Pla_Poa_Pla_Partida] FOREIGN KEY ([Pla_Partida_Id]) REFERENCES [dbo].[Pla_Partida] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

