CREATE PROCEDURE dbo.Apu_Presupuesto_Indice_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Estado char(3),
	@Descripcion varchar(2000),
	@Apu_Origen_Id varchar(17),
	@Apu_Insumo_Id varchar(17),
	@Apu_Indice_Id varchar(17),
	@Apu_Indice_Codigo varchar(200),
	@Apu_Indice_Nombre varchar(500),
	@Porcentaje numeric(5, 2),
	@Costo_Total numeric(17, 4),
	@Costo_Indice numeric(17, 4),
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
UPDATE [Apu_Presupuesto_Indice] SET [Id] = @Id, [Codigo] = @Codigo, [Estado] = @Estado, [Descripcion] = @Descripcion, [Apu_Origen_Id] = @Apu_Origen_Id, [Apu_Insumo_Id] = @Apu_Insumo_Id, [Apu_Indice_Id] = @Apu_Indice_Id, [Apu_Indice_Codigo] = @Apu_Indice_Codigo, [Apu_Indice_Nombre] = @Apu_Indice_Nombre, [Porcentaje] = @Porcentaje, [Costo_Total] = @Costo_Total, [Costo_Indice] = @Costo_Indice WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)) AND ((@IsNull_Apu_Origen_Id = 1 AND [Apu_Origen_Id] IS NULL) OR ([Apu_Origen_Id] = @Original_Apu_Origen_Id)) AND ((@IsNull_Apu_Insumo_Id = 1 AND [Apu_Insumo_Id] IS NULL) OR ([Apu_Insumo_Id] = @Original_Apu_Insumo_Id)) AND ((@IsNull_Apu_Indice_Id = 1 AND [Apu_Indice_Id] IS NULL) OR ([Apu_Indice_Id] = @Original_Apu_Indice_Id)) AND ((@IsNull_Apu_Indice_Codigo = 1 AND [Apu_Indice_Codigo] IS NULL) OR ([Apu_Indice_Codigo] = @Original_Apu_Indice_Codigo)) AND ((@IsNull_Apu_Indice_Nombre = 1 AND [Apu_Indice_Nombre] IS NULL) OR ([Apu_Indice_Nombre] = @Original_Apu_Indice_Nombre)) AND ([Porcentaje] = @Original_Porcentaje) AND ([Costo_Total] = @Original_Costo_Total) AND ([Costo_Indice] = @Original_Costo_Indice));
	
SELECT Id, Codigo, Estado, Descripcion, Apu_Origen_Id, Apu_Insumo_Id, Apu_Indice_Id, Apu_Indice_Codigo, Apu_Indice_Nombre, Porcentaje, Costo_Total, Costo_Indice FROM Apu_Presupuesto_Indice WHERE (Id = @Id)