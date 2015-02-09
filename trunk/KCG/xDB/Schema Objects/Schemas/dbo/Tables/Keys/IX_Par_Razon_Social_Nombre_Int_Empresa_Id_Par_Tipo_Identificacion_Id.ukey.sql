ALTER TABLE [dbo].[Par_Razon_Social]
    ADD CONSTRAINT [IX_Par_Razon_Social_Nombre_Int_Empresa_Id_Par_Tipo_Identificacion_Id] UNIQUE NONCLUSTERED ([Nombre] ASC, [Int_Empresa_Id] ASC, [Par_Tipo_Identificacion_Id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];

