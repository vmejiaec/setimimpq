﻿ALTER TABLE [dbo].[Apu_Presupuesto_Rubro]
    ADD CONSTRAINT [FK_Apu_Presupuesto_Rubro_Apu_Subtitulo] FOREIGN KEY ([Apu_Subtitulo_Id]) REFERENCES [dbo].[Apu_Subtitulo] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

