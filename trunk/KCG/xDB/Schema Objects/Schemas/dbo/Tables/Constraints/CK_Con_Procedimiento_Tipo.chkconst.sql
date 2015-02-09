ALTER TABLE [dbo].[Com_Procedimiento]
    ADD CONSTRAINT [CK_Con_Procedimiento_Tipo] CHECK ([Tipo]='CON' OR [Tipo]='OBR' OR [Tipo]='BSN' OR [Tipo]='SNR' OR [Tipo]='BNR' OR [Tipo]='NIN');


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'El tipo de procedimiento es: ...', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Com_Procedimiento', @level2type = N'CONSTRAINT', @level2name = N'CK_Con_Procedimiento_Tipo';

