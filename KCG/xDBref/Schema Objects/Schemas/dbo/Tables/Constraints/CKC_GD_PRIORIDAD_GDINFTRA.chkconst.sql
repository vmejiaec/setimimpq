﻿ALTER TABLE [dbo].[GDINFTRA]
    ADD CONSTRAINT [CKC_GD_PRIORIDAD_GDINFTRA] CHECK ([GD_PRIORIDAD] = 'URGENTE' or ([GD_PRIORIDAD] = 'MEDIA' or [GD_PRIORIDAD] = 'NORMAL'));

