﻿ALTER TABLE [dbo].[Apu_Proyecto_Rubro_Mano_Obra]
    ADD CONSTRAINT [FK_Apu_Proyecto_Rubro_Mano_Obra_Per_Personal1] FOREIGN KEY ([Update_Per_Personal_Id]) REFERENCES [dbo].[Per_Personal] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
