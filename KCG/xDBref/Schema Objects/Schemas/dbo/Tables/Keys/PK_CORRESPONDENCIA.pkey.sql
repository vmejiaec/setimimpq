﻿ALTER TABLE [dbo].[CORRESPONDENCIA]
    ADD CONSTRAINT [PK_CORRESPONDENCIA] PRIMARY KEY CLUSTERED ([CAT_COD] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

