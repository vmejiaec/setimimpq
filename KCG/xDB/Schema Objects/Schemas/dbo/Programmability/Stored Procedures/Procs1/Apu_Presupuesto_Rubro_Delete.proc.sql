CREATE PROCEDURE dbo.Apu_Presupuesto_Rubro_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(2000),
	@Original_Apu_Presupuesto_Id varchar(17),
	@Original_Apu_Rubro_id varchar(17),
	@Original_Apu_Rubro_Codigo varchar(200),
	@Original_Apu_Rubro_Nombre varchar(500),
	@Original_Apu_Rubro_Unidad varchar(200),
	@Original_Apu_Rubro_Cantidad numeric(17, 2),
	@Original_Costo_Unitario numeric(17, 4),
	@Original_Costo_Total numeric(17, 4),
	@IsNull_Apu_Subtitulo_Id Int,
	@Original_Apu_Subtitulo_Id varchar(17)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Apu_Presupuesto_Rubro] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)) AND ([Apu_Presupuesto_Id] = @Original_Apu_Presupuesto_Id) AND ([Apu_Rubro_id] = @Original_Apu_Rubro_id) AND ([Apu_Rubro_Codigo] = @Original_Apu_Rubro_Codigo) AND ([Apu_Rubro_Nombre] = @Original_Apu_Rubro_Nombre) AND ([Apu_Rubro_Unidad] = @Original_Apu_Rubro_Unidad) AND ([Apu_Rubro_Cantidad] = @Original_Apu_Rubro_Cantidad) AND ([Costo_Unitario] = @Original_Costo_Unitario) AND ([Costo_Total] = @Original_Costo_Total) AND ((@IsNull_Apu_Subtitulo_Id = 1 AND [Apu_Subtitulo_Id] IS NULL) OR ([Apu_Subtitulo_Id] = @Original_Apu_Subtitulo_Id)))