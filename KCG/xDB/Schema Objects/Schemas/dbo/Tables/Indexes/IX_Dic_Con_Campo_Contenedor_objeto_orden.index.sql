﻿CREATE NONCLUSTERED INDEX [IX_Dic_Con_Campo_Contenedor_objeto_orden]
    ON [dbo].[Dic_Con_Campo]([Orden] ASC, [Dic_Con_Objeto_Id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, MAXDOP = 0)
    ON [PRIMARY];

