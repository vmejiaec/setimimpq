ALTER TABLE [dbo].[Com_Contrato]
    ADD CONSTRAINT [CK_Con_Contrato_Estado] CHECK ([Estado]='DEF' OR [Estado]='PAR' OR [Estado]='EJE' OR [Estado]='FIR' OR [Estado]='ADJ' OR [Estado]='PRO' OR [Estado]='DES' OR [Estado]='CAN' OR [Estado]='PEN');


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'El Estado del contrato es:

- PEN : Recien creado
- CAN: Cancelado
- DES  : Desierto
- PRO : En Proceso
- ADJ : Adjudicado a un oferente
- FIR: Contrato firmado por el contratista
- EJE: En EJEcución y generando planillas
- PAR: Con entrega PARcial
- DEF: Con entrega DEFinitiva', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Com_Contrato', @level2type = N'CONSTRAINT', @level2name = N'CK_Con_Contrato_Estado';

