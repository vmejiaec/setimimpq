﻿CREATE PROCEDURE [dbo].[Apu_Proyecto_Categoria_Delete]
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Apu_Proyecto_Id varchar(17),
	@Original_Apu_Categoria_Id varchar(17),
	@Original_Costo_Diario numeric(17,4),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Apu_Proyecto_Categoria] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Apu_Proyecto_Id] = @Original_Apu_Proyecto_Id) AND ([Apu_Categoria_Id] = @Original_Apu_Categoria_Id) AND ([Costo_Diario] = @Original_Costo_Diario) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))