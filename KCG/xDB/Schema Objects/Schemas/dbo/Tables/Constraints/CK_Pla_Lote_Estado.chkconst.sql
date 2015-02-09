ALTER TABLE [dbo].[Pla_Lote]
    ADD CONSTRAINT [CK_Pla_Lote_Estado] CHECK ([Estado]='EJE' OR [Estado]='ERR' OR [Estado]='PEN');

