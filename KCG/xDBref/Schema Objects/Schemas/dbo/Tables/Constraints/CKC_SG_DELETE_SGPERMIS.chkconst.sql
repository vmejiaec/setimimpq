﻿ALTER TABLE [dbo].[SGPERMISOS]
    ADD CONSTRAINT [CKC_SG_DELETE_SGPERMIS] CHECK ([SG_DELETE] = 'NO' or [SG_DELETE] = 'SI');
