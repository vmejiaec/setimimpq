﻿ALTER TABLE [dbo].[GDTRAMITE_FUNCIONARIO]
    ADD CONSTRAINT [PK_GDTRAMITE_FUNCIONARIO] PRIMARY KEY CLUSTERED ([GD_CODIGO_TRAMITE] ASC, [GD_CODIGO_INSTITUCION] ASC, [GD_CODIGO_PERSONA] ASC) WITH (FILLFACTOR = 90, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);
