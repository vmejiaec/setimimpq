CREATE PROCEDURE dbo.Apu_Presupuesto_Rubro_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Estado char(3),
	@Descripcion varchar(2000),
	@Apu_Presupuesto_Id varchar(17),
	@Apu_Rubro_id varchar(17),
	@Apu_Rubro_Codigo varchar(200),
	@Apu_Rubro_Nombre varchar(500),
	@Apu_Rubro_Unidad varchar(200),
	@Apu_Rubro_Cantidad numeric(17, 2),
	@Costo_Unitario numeric(17, 4),
	@Costo_Total numeric(17, 4),
	@Apu_Subtitulo_Id varchar(17),
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
UPDATE [Apu_Presupuesto_Rubro] SET [Id] = @Id, [Codigo] = @Codigo, [Estado] = @Estado, [Descripcion] = @Descripcion, [Apu_Presupuesto_Id] = @Apu_Presupuesto_Id, [Apu_Rubro_id] = @Apu_Rubro_id, [Apu_Rubro_Codigo] = @Apu_Rubro_Codigo, [Apu_Rubro_Nombre] = @Apu_Rubro_Nombre, [Apu_Rubro_Unidad] = @Apu_Rubro_Unidad, [Apu_Rubro_Cantidad] = @Apu_Rubro_Cantidad, [Costo_Unitario] = @Costo_Unitario, [Costo_Total] = @Costo_Total, [Apu_Subtitulo_Id] = @Apu_Subtitulo_Id WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)) AND ([Apu_Presupuesto_Id] = @Original_Apu_Presupuesto_Id) AND ([Apu_Rubro_id] = @Original_Apu_Rubro_id) AND ([Apu_Rubro_Codigo] = @Original_Apu_Rubro_Codigo) AND ([Apu_Rubro_Nombre] = @Original_Apu_Rubro_Nombre) AND ([Apu_Rubro_Unidad] = @Original_Apu_Rubro_Unidad) AND ([Apu_Rubro_Cantidad] = @Original_Apu_Rubro_Cantidad) AND ([Costo_Unitario] = @Original_Costo_Unitario) AND ([Costo_Total] = @Original_Costo_Total) AND ((@IsNull_Apu_Subtitulo_Id = 1 AND [Apu_Subtitulo_Id] IS NULL) OR ([Apu_Subtitulo_Id] = @Original_Apu_Subtitulo_Id)));
	
SELECT Id, Codigo, Estado, Descripcion, Apu_Presupuesto_Id, Apu_Rubro_id, Apu_Rubro_Codigo, Apu_Rubro_Nombre, Apu_Rubro_Unidad, Apu_Rubro_Cantidad, Costo_Unitario, Costo_Total, Apu_Subtitulo_Id FROM Apu_Presupuesto_Rubro WHERE (Id = @Id)