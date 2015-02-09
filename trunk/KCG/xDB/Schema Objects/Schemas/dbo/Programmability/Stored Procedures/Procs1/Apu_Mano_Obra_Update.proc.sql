CREATE PROCEDURE [dbo].[Apu_Mano_Obra_Update]
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
	@Estado char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_Disponible varchar(3),
	@Original_Costo_Diario numeric(17, 2),
	@IsNull_Apu_Categoria_Id Int,
	@Original_Apu_Categoria_Id varchar(17),
	@Original_Int_Sucursal_Id varchar(17),
	@Original_Int_Moneda_Id varchar(17),
	@Original_Fecha_Creacion smalldatetime,
	@Original_Creacion_Per_Personal_Id varchar(17),
	@Original_Fecha_Update smalldatetime,
	@Original_Update_Per_Personal_Id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
UPDATE [Apu_Mano_Obra] 
SET [Id] = @Id, [Codigo] = @Codigo, [Nombre] = @Nombre, [Disponible] = @Disponible, [Costo_Diario] = @Costo_Diario, [Apu_Categoria_Id] = @Apu_Categoria_Id, [Int_Sucursal_Id] = @Int_Sucursal_Id, [Int_Moneda_Id] = @Int_Moneda_Id, [Fecha_Creacion] = @Fecha_Creacion, [Creacion_Per_Personal_Id] = @Creacion_Per_Personal_Id, [Fecha_Update] = getDate(), [Update_Per_Personal_Id] = @Update_Per_Personal_Id, [Estado] = @Estado 
WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Disponible] = @Original_Disponible) AND ([Costo_Diario] = @Original_Costo_Diario) AND ((@IsNull_Apu_Categoria_Id = 1 AND [Apu_Categoria_Id] IS NULL) OR ([Apu_Categoria_Id] = @Original_Apu_Categoria_Id)) AND ([Int_Sucursal_Id] = @Original_Int_Sucursal_Id) AND ([Int_Moneda_Id] = @Original_Int_Moneda_Id) AND ([Fecha_Creacion] = @Original_Fecha_Creacion) AND ([Creacion_Per_Personal_Id] = @Original_Creacion_Per_Personal_Id) AND ([Fecha_Update] = @Original_Fecha_Update) AND ([Update_Per_Personal_Id] = @Original_Update_Per_Personal_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Nombre, Disponible, Costo_Diario, Apu_Categoria_Id, Int_Sucursal_Id, Int_Moneda_Id, Fecha_Creacion, Creacion_Per_Personal_Id, Fecha_Update, Update_Per_Personal_Id, Estado FROM Apu_Mano_Obra WHERE (Id = @Id)


