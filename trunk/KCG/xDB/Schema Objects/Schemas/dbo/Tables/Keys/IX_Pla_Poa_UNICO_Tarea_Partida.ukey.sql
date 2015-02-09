ALTER TABLE [dbo].[Pla_Poa]
    ADD CONSTRAINT [IX_Pla_Poa_UNICO_Tarea_Partida] UNIQUE NONCLUSTERED ([Pla_Tarea_Id] ASC, [Pla_Partida_Id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Clave única de Tarea y Partida', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Pla_Poa', @level2type = N'CONSTRAINT', @level2name = N'IX_Pla_Poa_UNICO_Tarea_Partida';

