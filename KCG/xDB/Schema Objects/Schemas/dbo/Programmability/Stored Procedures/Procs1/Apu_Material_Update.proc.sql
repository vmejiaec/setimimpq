CREATE PROCEDURE [dbo].[Apu_Material_Update]
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
	@Estado char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_Unidad varchar(200),
	@Original_Costo_Parcial numeric(17, 4),
	@Original_Costo_Otros numeric(17, 4),
	@Original_Costo_Transporte numeric(17, 4),
	@Original_Disponible varchar(3),
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
UPDATE [Apu_Material] 
SET [Id] = @Id, [Codigo] = @Codigo, [Nombre] = @Nombre, [Unidad] = @Unidad, [Costo_Parcial] = @Costo_Parcial, [Costo_Otros] = @Costo_Otros, [Costo_Transporte] = @Costo_Transporte, [Disponible] = @Disponible, [Int_Sucursal_Id] = @Int_Sucursal_Id, [Int_Moneda_Id] = @Int_Moneda_Id, [Fecha_Creacion] = @Fecha_Creacion, [Creacion_Per_Personal_Id] = @Creacion_Per_Personal_Id, [Fecha_Update] = GetDate(), [Update_Per_Personal_Id] = @Update_Per_Personal_Id, [Estado] = @Estado 
WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Unidad] = @Original_Unidad) AND ([Costo_Parcial] = @Original_Costo_Parcial) AND ([Costo_Otros] = @Original_Costo_Otros) AND ([Costo_Transporte] = @Original_Costo_Transporte) AND ([Disponible] = @Original_Disponible) AND ([Int_Sucursal_Id] = @Original_Int_Sucursal_Id) AND ([Int_Moneda_Id] = @Original_Int_Moneda_Id) AND ([Fecha_Creacion] = @Original_Fecha_Creacion) AND ([Creacion_Per_Personal_Id] = @Original_Creacion_Per_Personal_Id) AND ([Fecha_Update] = @Original_Fecha_Update) AND ([Update_Per_Personal_Id] = @Original_Update_Per_Personal_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Nombre, Unidad, Costo_Parcial, Costo_Otros, Costo_Transporte, Disponible, Int_Sucursal_Id, Int_Moneda_Id, Fecha_Creacion, Creacion_Per_Personal_Id, Fecha_Update, Update_Per_Personal_Id, Estado FROM Apu_Material WHERE (Id = @Id)


