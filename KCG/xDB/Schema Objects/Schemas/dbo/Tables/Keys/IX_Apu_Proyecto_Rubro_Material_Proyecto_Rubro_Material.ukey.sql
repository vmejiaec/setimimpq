ALTER TABLE [dbo].[Apu_Proyecto_Rubro_Material]
    ADD CONSTRAINT [IX_Apu_Proyecto_Rubro_Material_Proyecto_Rubro_Material] UNIQUE NONCLUSTERED ([Apu_Proyecto_Rubro_Id] ASC, [Apu_Material_Id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];

