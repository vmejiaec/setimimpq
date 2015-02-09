ALTER TABLE [dbo].[Pla_Poa]
    ADD CONSTRAINT [FK_Pla_Poa_Pla_Tarea] FOREIGN KEY ([Pla_Tarea_Id]) REFERENCES [dbo].[Pla_Tarea] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

