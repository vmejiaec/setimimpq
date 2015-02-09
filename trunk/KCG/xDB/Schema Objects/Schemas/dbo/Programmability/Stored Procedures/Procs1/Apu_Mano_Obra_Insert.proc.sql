CREATE PROCEDURE [dbo].[Apu_Mano_Obra_Insert]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Disponible varchar(3),
	@Costo_Diario numeric(17, 2),
	@Apu_Categoria_Id varchar(17),
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
INSERT INTO [Apu_Mano_Obra] ([Id], [Codigo], [Nombre], [Disponible], [Costo_Diario], [Apu_Categoria_Id], [Int_Sucursal_Id], [Int_Moneda_Id], [Fecha_Creacion], [Creacion_Per_Personal_Id], [Fecha_Update], [Update_Per_Personal_Id], [Estado]) VALUES (@Id, @Codigo, @Nombre, @Disponible, @Costo_Diario, @Apu_Categoria_Id, @Int_Sucursal_Id, @Int_Moneda_Id, getdate(), @Creacion_Per_Personal_Id, getdate(), @Update_Per_Personal_Id, @Estado);
	
SELECT Id, Codigo, Nombre, Disponible, Costo_Diario, Apu_Categoria_Id, Int_Sucursal_Id, Int_Moneda_Id, Fecha_Creacion, Creacion_Per_Personal_Id, Fecha_Update, Update_Per_Personal_Id, Estado FROM Apu_Mano_Obra WHERE (Id = @Id)


