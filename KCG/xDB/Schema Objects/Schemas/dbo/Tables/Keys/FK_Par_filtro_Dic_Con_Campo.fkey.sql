ALTER TABLE [dbo].[Par_Filtro]
    ADD CONSTRAINT [FK_Par_filtro_Dic_Con_Campo] FOREIGN KEY ([dic_con_campo_id]) REFERENCES [dbo].[Dic_Con_Campo] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

