﻿ALTER TABLE [dbo].[GDINFINS]
    ADD CONSTRAINT [CKC_GD_ESTADO_GDINFINS] CHECK ([GD_ESTADO] = 'PASIVO' or [GD_ESTADO] = 'ACTIVO');
