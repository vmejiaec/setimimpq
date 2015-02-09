CREATE PROCEDURE dbo.Apu_Proyecto_Equipo_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Costo_Combustible numeric(17, 4),
	@Costo_Repuesto numeric(17, 4),
	@Costo_Mantenimiento numeric(17, 4),
	@Costo_Alquiler numeric(17, 4),
	@Costo_Otros numeric(17, 4),
	@Apu_Proyecto_Id varchar(17),
	@Apu_Equipo_Id varchar(17),
	@Estado char(3),
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
UPDATE [Apu_Proyecto_Equipo] SET [Id] = @Id, [Codigo] = @Codigo, [Costo_Combustible] = @Costo_Combustible, [Costo_Repuesto] = @Costo_Repuesto, [Costo_Mantenimiento] = @Costo_Mantenimiento, [Costo_Alquiler] = @Costo_Alquiler, [Costo_Otros] = @Costo_Otros, [Apu_Proyecto_Id] = @Apu_Proyecto_Id, [Apu_Equipo_Id] = @Apu_Equipo_Id, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Costo_Combustible] = @Original_Costo_Combustible) AND ([Costo_Repuesto] = @Original_Costo_Repuesto) AND ([Costo_Mantenimiento] = @Original_Costo_Mantenimiento) AND ([Costo_Alquiler] = @Original_Costo_Alquiler) AND ([Costo_Otros] = @Original_Costo_Otros) AND ([Apu_Proyecto_Id] = @Original_Apu_Proyecto_Id) AND ([Apu_Equipo_Id] = @Original_Apu_Equipo_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Costo_Combustible, Costo_Repuesto, Costo_Mantenimiento, Costo_Alquiler, Costo_Otros, Apu_Proyecto_Id, Apu_Equipo_Id, Estado FROM Apu_Proyecto_Equipo WHERE (Id = @Id)