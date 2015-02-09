CREATE PROCEDURE [dbo].[Apu_Proyecto_Transporte_Indice_Delete]
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Apu_Proyecto_Id varchar(17),
	@Original_Apu_Indice_Id varchar(17),
	@Original_Porcentaje numeric(5, 2),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Apu_Proyecto_Transporte_Indice] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Apu_Proyecto_Id] = @Original_Apu_Proyecto_Id) AND ([Apu_Indice_Id] = @Original_Apu_Indice_Id) AND ([Porcentaje] = @Original_Porcentaje) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))
