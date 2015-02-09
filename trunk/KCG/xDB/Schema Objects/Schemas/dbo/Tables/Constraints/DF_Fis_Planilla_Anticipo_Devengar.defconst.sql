ALTER TABLE [dbo].[Fis_Planilla]
    ADD CONSTRAINT [DF_Fis_Planilla_Anticipo_Devengar] DEFAULT ((0)) FOR [Anticipo_Devengar];

