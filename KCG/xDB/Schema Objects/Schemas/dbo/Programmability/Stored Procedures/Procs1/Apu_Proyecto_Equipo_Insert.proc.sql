CREATE PROCEDURE dbo.Apu_Proyecto_Equipo_Insert
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
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apu_Proyecto_Equipo] ([Id], [Codigo], [Costo_Combustible], [Costo_Repuesto], [Costo_Mantenimiento], [Costo_Alquiler], [Costo_Otros], [Apu_Proyecto_Id], [Apu_Equipo_Id], [Estado]) VALUES (@Id, @Codigo, @Costo_Combustible, @Costo_Repuesto, @Costo_Mantenimiento, @Costo_Alquiler, @Costo_Otros, @Apu_Proyecto_Id, @Apu_Equipo_Id, @Estado);
	
SELECT Id, Codigo, Costo_Combustible, Costo_Repuesto, Costo_Mantenimiento, Costo_Alquiler, Costo_Otros, Apu_Proyecto_Id, Apu_Equipo_Id, Estado FROM Apu_Proyecto_Equipo WHERE (Id = @Id)