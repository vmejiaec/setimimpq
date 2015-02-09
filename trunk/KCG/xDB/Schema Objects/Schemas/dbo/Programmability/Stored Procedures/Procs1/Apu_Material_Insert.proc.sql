CREATE PROCEDURE [dbo].[Apu_Material_Insert]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Unidad varchar(200),
	@Costo_Parcial numeric(17, 4),
	@Costo_Otros numeric(17, 4),
	@Costo_Transporte numeric(17, 4),
	@Disponible varchar(3),
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
INSERT INTO [Apu_Material] ([Id], [Codigo], [Nombre], [Unidad], [Costo_Parcial], [Costo_Otros], [Costo_Transporte], [Disponible], [Int_Sucursal_Id], [Int_Moneda_Id], [Fecha_Creacion], [Creacion_Per_Personal_Id], [Fecha_Update], [Update_Per_Personal_Id], [Estado]) 
VALUES (@Id, @Codigo, @Nombre, @Unidad, @Costo_Parcial, @Costo_Otros, @Costo_Transporte, @Disponible, @Int_Sucursal_Id, @Int_Moneda_Id, getDate(), @Creacion_Per_Personal_Id, getDate(), @Update_Per_Personal_Id, @Estado);
	
SELECT Id, Codigo, Nombre, Unidad, Costo_Parcial, Costo_Otros, Costo_Transporte, Disponible, Int_Sucursal_Id, Int_Moneda_Id, Fecha_Creacion, Creacion_Per_Personal_Id, Fecha_Update, Update_Per_Personal_Id, Estado FROM Apu_Material WHERE (Id = @Id)



