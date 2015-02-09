ALTER TABLE [dbo].[Pla_Doc]
    ADD CONSTRAINT [CK_Pla_Doc_Tipo] CHECK ([Tipo]='REP' OR [Tipo]='CER' OR [Tipo]='DDM' OR [Tipo]='CIM' OR [Tipo]='ASI');

