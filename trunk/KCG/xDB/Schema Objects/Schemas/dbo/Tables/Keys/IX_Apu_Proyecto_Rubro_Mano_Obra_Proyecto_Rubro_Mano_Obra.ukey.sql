ALTER TABLE [dbo].[Apu_Proyecto_Rubro_Mano_Obra]
    ADD CONSTRAINT [IX_Apu_Proyecto_Rubro_Mano_Obra_Proyecto_Rubro_Mano_Obra] UNIQUE NONCLUSTERED ([Apu_Proyecto_Rubro_Id] ASC, [Apu_Mano_Obra_Id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];

