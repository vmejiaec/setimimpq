﻿ALTER TABLE [dbo].[Apu_Proyecto]
    ADD CONSTRAINT [FK_Apu_Proyecto_Per_Personal2] FOREIGN KEY ([Tecnico_Per_Personal_Id]) REFERENCES [dbo].[Per_Personal] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

