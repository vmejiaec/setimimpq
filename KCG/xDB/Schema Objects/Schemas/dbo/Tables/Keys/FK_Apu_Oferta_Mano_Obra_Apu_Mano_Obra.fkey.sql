﻿ALTER TABLE [dbo].[Apu_Oferta_Mano_Obra]
    ADD CONSTRAINT [FK_Apu_Oferta_Mano_Obra_Apu_Mano_Obra] FOREIGN KEY ([Apu_Mano_Obra_Id]) REFERENCES [dbo].[Apu_Mano_Obra] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

