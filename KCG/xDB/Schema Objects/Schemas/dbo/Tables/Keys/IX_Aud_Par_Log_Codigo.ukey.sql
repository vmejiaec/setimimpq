﻿ALTER TABLE [dbo].[Aud_Par_Log]
    ADD CONSTRAINT [IX_Aud_Par_Log_Codigo] UNIQUE NONCLUSTERED ([Codigo] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];

