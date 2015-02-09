ALTER TABLE [dbo].[Pla_Doc]
    ADD CONSTRAINT [CK_Pla_Doc_Estado] CHECK ([Estado]='PRO' OR [Estado]='PEN');


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'El campo Estado puede ser:

- ''PEN'' : Pendiente de procesamiento en Contratación
- ''PRO'' : Procesada y no puede ser modificada', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Pla_Doc', @level2type = N'CONSTRAINT', @level2name = N'CK_Pla_Doc_Estado';

