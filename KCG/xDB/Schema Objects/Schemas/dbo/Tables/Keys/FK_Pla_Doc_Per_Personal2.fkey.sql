﻿ALTER TABLE [dbo].[Pla_Doc]
    ADD CONSTRAINT [FK_Pla_Doc_Per_Personal2] FOREIGN KEY ([Per_Personal_Id_Modifica]) REFERENCES [dbo].[Per_Personal] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

