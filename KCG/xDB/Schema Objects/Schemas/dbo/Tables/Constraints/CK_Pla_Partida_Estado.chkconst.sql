ALTER TABLE [dbo].[Pla_Partida]
    ADD CONSTRAINT [CK_Pla_Partida_Estado] CHECK ([Estado]='APR' OR [Estado]='PEN');

