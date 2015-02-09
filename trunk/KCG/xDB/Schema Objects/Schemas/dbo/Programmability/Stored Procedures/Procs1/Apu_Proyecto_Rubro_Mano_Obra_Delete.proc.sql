CREATE PROCEDURE dbo.Apu_Proyecto_Rubro_Mano_Obra_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Apu_Proyecto_Rubro_Id varchar(17),
	@Original_Apu_Mano_Obra_Id varchar(17),
	@Original_Cantidad numeric(17, 4),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@Original_Fecha_Creacion smalldatetime,
	@Original_Creacion_Per_Personal_Id varchar(17),
	@Original_Fecha_Update smalldatetime,
	@Original_Update_Per_Personal_Id varchar(17)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Apu_Proyecto_Rubro_Mano_Obra] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Apu_Proyecto_Rubro_Id] = @Original_Apu_Proyecto_Rubro_Id) AND ([Apu_Mano_Obra_Id] = @Original_Apu_Mano_Obra_Id) AND ([Cantidad] = @Original_Cantidad) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ([Fecha_Creacion] = @Original_Fecha_Creacion) AND ([Creacion_Per_Personal_Id] = @Original_Creacion_Per_Personal_Id) AND ([Fecha_Update] = @Original_Fecha_Update) AND ([Update_Per_Personal_Id] = @Original_Update_Per_Personal_Id))