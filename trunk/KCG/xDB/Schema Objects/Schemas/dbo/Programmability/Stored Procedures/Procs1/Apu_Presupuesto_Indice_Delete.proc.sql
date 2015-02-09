CREATE PROCEDURE dbo.Apu_Presupuesto_Indice_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(2000),
	@IsNull_Apu_Origen_Id Int,
	@Original_Apu_Origen_Id varchar(17),
	@IsNull_Apu_Insumo_Id Int,
	@Original_Apu_Insumo_Id varchar(17),
	@IsNull_Apu_Indice_Id Int,
	@Original_Apu_Indice_Id varchar(17),
	@IsNull_Apu_Indice_Codigo Int,
	@Original_Apu_Indice_Codigo varchar(200),
	@IsNull_Apu_Indice_Nombre Int,
	@Original_Apu_Indice_Nombre varchar(500),
	@Original_Porcentaje numeric(5, 2),
	@Original_Costo_Total numeric(17, 4),
	@Original_Costo_Indice numeric(17, 4)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Apu_Presupuesto_Indice] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)) AND ((@IsNull_Apu_Origen_Id = 1 AND [Apu_Origen_Id] IS NULL) OR ([Apu_Origen_Id] = @Original_Apu_Origen_Id)) AND ((@IsNull_Apu_Insumo_Id = 1 AND [Apu_Insumo_Id] IS NULL) OR ([Apu_Insumo_Id] = @Original_Apu_Insumo_Id)) AND ((@IsNull_Apu_Indice_Id = 1 AND [Apu_Indice_Id] IS NULL) OR ([Apu_Indice_Id] = @Original_Apu_Indice_Id)) AND ((@IsNull_Apu_Indice_Codigo = 1 AND [Apu_Indice_Codigo] IS NULL) OR ([Apu_Indice_Codigo] = @Original_Apu_Indice_Codigo)) AND ((@IsNull_Apu_Indice_Nombre = 1 AND [Apu_Indice_Nombre] IS NULL) OR ([Apu_Indice_Nombre] = @Original_Apu_Indice_Nombre)) AND ([Porcentaje] = @Original_Porcentaje) AND ([Costo_Total] = @Original_Costo_Total) AND ([Costo_Indice] = @Original_Costo_Indice))