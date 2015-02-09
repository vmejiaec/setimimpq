ALTER TABLE [dbo].[Pla_Tarea]
    ADD CONSTRAINT [FK_Pla_Tarea_Pla_Cta] FOREIGN KEY ([Pla_Cta_Id]) REFERENCES [dbo].[Pla_Cta] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

