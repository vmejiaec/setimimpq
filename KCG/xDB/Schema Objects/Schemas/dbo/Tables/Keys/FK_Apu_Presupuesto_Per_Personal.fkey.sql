ALTER TABLE [dbo].[Apu_Presupuesto]
    ADD CONSTRAINT [FK_Apu_Presupuesto_Per_Personal] FOREIGN KEY ([Fiscalizador_Per_Personal_Id]) REFERENCES [dbo].[Per_Personal] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

