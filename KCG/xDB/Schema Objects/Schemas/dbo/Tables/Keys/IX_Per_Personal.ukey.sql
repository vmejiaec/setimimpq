﻿ALTER TABLE [dbo].[Per_Personal]
    ADD CONSTRAINT [IX_Per_Personal] UNIQUE NONCLUSTERED ([Par_Razon_Social_Id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY];
