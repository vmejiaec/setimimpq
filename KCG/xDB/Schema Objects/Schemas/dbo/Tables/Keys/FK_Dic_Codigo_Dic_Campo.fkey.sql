﻿ALTER TABLE [dbo].[Dic_Codigo]
    ADD CONSTRAINT [FK_Dic_Codigo_Dic_Campo] FOREIGN KEY ([Dic_Campo_Id]) REFERENCES [dbo].[Dic_Campo] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

