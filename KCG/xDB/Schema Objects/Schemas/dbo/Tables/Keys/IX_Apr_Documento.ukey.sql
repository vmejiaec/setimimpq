﻿ALTER TABLE [dbo].[Apr_Documento]
    ADD CONSTRAINT [IX_Apr_Documento] UNIQUE NONCLUSTERED ([Dic_Campo_id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];
