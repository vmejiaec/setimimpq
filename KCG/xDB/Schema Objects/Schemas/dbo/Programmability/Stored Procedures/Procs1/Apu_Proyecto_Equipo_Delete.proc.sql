CREATE PROCEDURE dbo.Apu_Proyecto_Equipo_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Costo_Combustible numeric(17, 4),
	@Original_Costo_Repuesto numeric(17, 4),
	@Original_Costo_Mantenimiento numeric(17, 4),
	@Original_Costo_Alquiler numeric(17, 4),
	@Original_Costo_Otros numeric(17, 4),
	@Original_Apu_Proyecto_Id varchar(17),
	@Original_Apu_Equipo_Id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Apu_Proyecto_Equipo] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Costo_Combustible] = @Original_Costo_Combustible) AND ([Costo_Repuesto] = @Original_Costo_Repuesto) AND ([Costo_Mantenimiento] = @Original_Costo_Mantenimiento) AND ([Costo_Alquiler] = @Original_Costo_Alquiler) AND ([Costo_Otros] = @Original_Costo_Otros) AND ([Apu_Proyecto_Id] = @Original_Apu_Proyecto_Id) AND ([Apu_Equipo_Id] = @Original_Apu_Equipo_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))