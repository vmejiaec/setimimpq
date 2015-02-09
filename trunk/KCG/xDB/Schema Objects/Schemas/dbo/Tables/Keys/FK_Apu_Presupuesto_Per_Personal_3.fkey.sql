ALTER TABLE [dbo].[Apu_Presupuesto]
    ADD CONSTRAINT [FK_Apu_Presupuesto_Per_Personal_3] FOREIGN KEY ([Creacion_Per_Personal_Id]) REFERENCES [dbo].[Per_Personal] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

