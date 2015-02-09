CREATE PROCEDURE dbo.Apu_Presupuesto_Rubro_Insumo_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(2000),
	@Original_Origen char(3),
	@Original_Apu_Origen_Id varchar(17),
	@Original_Apu_Rubro_Id varchar(17),
	@Original_Apu_Rubro_Codigo varchar(200),
	@Original_Apu_Rubro_Nombre varchar(500),
	@Original_Apu_Rubro_Cantidad numeric(17, 2),
	@Original_Apu_Rubro_Unidad varchar(200),
	@Original_Insumo char(3),
	@Original_Apu_Insumo_Id varchar(17),
	@Original_Apu_Insumo_Codigo varchar(200),
	@Original_Apu_Insumo_Nombre varchar(500),
	@IsNull_Apu_Categoria_Id Int,
	@Original_Apu_Categoria_Id varchar(17),
	@IsNull_Apu_Categoria_Codigo Int,
	@Original_Apu_Categoria_Codigo varchar(200),
	@IsNull_Apu_Categoria_Nombre Int,
	@Original_Apu_Categoria_Nombre varchar(500),
	@Original_Costo_Diario numeric(17, 4),
	@Original_Rendimiento numeric(17, 4),
	@Original_Cantidad numeric(17, 4)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Apu_Presupuesto_Rubro_Insumo] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)) AND ([Origen] = @Original_Origen) AND ([Apu_Origen_Id] = @Original_Apu_Origen_Id) AND ([Apu_Rubro_Id] = @Original_Apu_Rubro_Id) AND ([Apu_Rubro_Codigo] = @Original_Apu_Rubro_Codigo) AND ([Apu_Rubro_Nombre] = @Original_Apu_Rubro_Nombre) AND ([Apu_Rubro_Cantidad] = @Original_Apu_Rubro_Cantidad) AND ([Apu_Rubro_Unidad] = @Original_Apu_Rubro_Unidad) AND ([Insumo] = @Original_Insumo) AND ([Apu_Insumo_Id] = @Original_Apu_Insumo_Id) AND ([Apu_Insumo_Codigo] = @Original_Apu_Insumo_Codigo) AND ([Apu_Insumo_Nombre] = @Original_Apu_Insumo_Nombre) AND ((@IsNull_Apu_Categoria_Id = 1 AND [Apu_Categoria_Id] IS NULL) OR ([Apu_Categoria_Id] = @Original_Apu_Categoria_Id)) AND ((@IsNull_Apu_Categoria_Codigo = 1 AND [Apu_Categoria_Codigo] IS NULL) OR ([Apu_Categoria_Codigo] = @Original_Apu_Categoria_Codigo)) AND ((@IsNull_Apu_Categoria_Nombre = 1 AND [Apu_Categoria_Nombre] IS NULL) OR ([Apu_Categoria_Nombre] = @Original_Apu_Categoria_Nombre)) AND ([Costo_Diario] = @Original_Costo_Diario) AND ([Rendimiento] = @Original_Rendimiento) AND ([Cantidad] = @Original_Cantidad))