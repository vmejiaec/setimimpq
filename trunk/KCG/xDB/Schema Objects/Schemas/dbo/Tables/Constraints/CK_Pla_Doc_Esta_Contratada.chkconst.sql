ALTER TABLE [dbo].[Pla_Doc]
    ADD CONSTRAINT [CK_Pla_Doc_Esta_Contratada] CHECK ([Esta_Contratada]='NOC' OR [Esta_Contratada]='SIC' OR [Esta_Contratada]='PEN');


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Esta_Contratada puede ser:

- ''PEN''  : Pendiente de que Contratación la tramite
-''NOC''  : Contratación indica que NO está contemplada en el PAC
-''SIC''     : Contratación indica que SI está contemplada en el PAC', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Pla_Doc', @level2type = N'CONSTRAINT', @level2name = N'CK_Pla_Doc_Esta_Contratada';

