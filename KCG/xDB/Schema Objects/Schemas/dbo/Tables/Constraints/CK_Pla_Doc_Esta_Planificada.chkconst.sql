ALTER TABLE [dbo].[Pla_Doc]
    ADD CONSTRAINT [CK_Pla_Doc_Esta_Planificada] CHECK ([Esta_Planificada]='NOP' OR [Esta_Planificada]='SIP' OR [Esta_Planificada]='PEN');


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Esta_Planificada puede ser: 

- ''PEN'' : Está PENdiente de que Planificación la tramite
-''NOP'' : Planificación indica que NO esta planificada en el POA
- ''SIP''   : Planificación indica que SI esta planificada en el POA', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Pla_Doc', @level2type = N'CONSTRAINT', @level2name = N'CK_Pla_Doc_Esta_Planificada';

