﻿ALTER TABLE [dbo].[GDINFTRA]
    ADD CONSTRAINT [CKC_GD_NUMERO_REESTRU_GDINFTRA] CHECK ([GD_NUMERO_REESTRUCTURA] >= 0);
