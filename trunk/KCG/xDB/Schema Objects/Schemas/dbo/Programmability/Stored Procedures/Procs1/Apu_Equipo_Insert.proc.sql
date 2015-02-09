CREATE PROCEDURE [dbo].[Apu_Equipo_Insert]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Disponible varchar(3),
	@Costo_Combustible numeric(17, 4),
	@Costo_Repuesto numeric(17, 4),
	@Costo_Mantenimiento numeric(17, 0),
	@Costo_Alquiler numeric(17, 4),
	@Costo_Otros numeric(17, 4),
	@Int_Sucursal_Id varchar(17),
	@Int_Moneda_Id varchar(17),
	@Fecha_Creacion smalldatetime,
	@Creacion_Per_Personal_Id varchar(17),
	@Fecha_Update smalldatetime,
	@Update_Per_Personal_Id varchar(17),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apu_Equipo] ([Id], [Codigo], [Nombre], [Disponible], [Costo_Combustible], [Costo_Repuesto], [Costo_Mantenimiento], [Costo_Alquiler], [Costo_Otros], [Int_Sucursal_Id], [Int_Moneda_Id], [Fecha_Creacion], [Creacion_Per_Personal_Id], [Fecha_Update], [Update_Per_Personal_Id], [Estado]) VALUES (@Id, @Codigo, @Nombre, @Disponible, @Costo_Combustible, @Costo_Repuesto, @Costo_Mantenimiento, @Costo_Alquiler, @Costo_Otros, @Int_Sucursal_Id, @Int_Moneda_Id, getdate(), @Creacion_Per_Personal_Id, getdate(), @Update_Per_Personal_Id, @Estado);
	
SELECT Id, Codigo, Nombre, Disponible, Costo_Combustible, Costo_Repuesto, Costo_Mantenimiento, Costo_Alquiler, Costo_Otros, Int_Sucursal_Id, Int_Moneda_Id, Fecha_Creacion, Creacion_Per_Personal_Id, Fecha_Update, Update_Per_Personal_Id, Estado FROM Apu_Equipo WHERE (Id = @Id)


