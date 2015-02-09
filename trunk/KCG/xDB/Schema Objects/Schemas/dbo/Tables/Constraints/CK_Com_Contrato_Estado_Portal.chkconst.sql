ALTER TABLE [dbo].[Com_Contrato]
    ADD CONSTRAINT [CK_Com_Contrato_Estado_Portal] CHECK ([Estado_Portal]='PYR' OR [Estado_Portal]='POR' OR [Estado_Portal]='ESP' OR [Estado_Portal]='DES' OR [Estado_Portal]='ERR' OR [Estado_Portal]='CAL' OR [Estado_Portal]='ADJ' OR [Estado_Portal]='SUB');


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Dominio de Estado_Portal.

''PYR'' Preguntas y Respuestas 
''POR'' Portal
''ESP''  Esperando Propuesta
''DES''  Desierto
''ERR'' Convalidación de errores
''CAL'' Calificación de Participantes
''ADJ'' Adjudicado
''SUB'' Por Subir', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Com_Contrato', @level2type = N'CONSTRAINT', @level2name = N'CK_Com_Contrato_Estado_Portal';

