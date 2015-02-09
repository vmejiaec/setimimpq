ALTER TABLE [dbo].[Seg_Menu]
    ADD CONSTRAINT [FK_Seg_Menu_Dic_Pantalla] FOREIGN KEY ([Dic_Pantalla_Id]) REFERENCES [dbo].[Dic_Pantalla] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

