﻿ALTER TABLE [dbo].[GDINFTRA]
    ADD CONSTRAINT [CKC_GD_ANULADO_GDINFTRA] CHECK ([GD_ANULADO] = 'NO' or [GD_ANULADO] = 'SI');

