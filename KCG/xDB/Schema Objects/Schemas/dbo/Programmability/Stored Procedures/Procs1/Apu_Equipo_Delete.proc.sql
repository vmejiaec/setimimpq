CREATE PROCEDURE [dbo].[Apu_Equipo_Delete]
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_Disponible varchar(3),
	@Original_Costo_Combustible numeric(17, 4),
	@Original_Costo_Repuesto numeric(17, 4),
	@Original_Costo_Mantenimiento numeric(17, 0),
	@Original_Costo_Alquiler numeric(17, 4),
	@Original_Costo_Otros numeric(17, 4),
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
DELETE FROM [Apu_Equipo] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Disponible] = @Original_Disponible) AND ([Costo_Combustible] = @Original_Costo_Combustible) AND ([Costo_Repuesto] = @Original_Costo_Repuesto) AND ([Costo_Mantenimiento] = @Original_Costo_Mantenimiento) AND ([Costo_Alquiler] = @Original_Costo_Alquiler) AND ([Costo_Otros] = @Original_Costo_Otros) AND ([Int_Sucursal_Id] = @Original_Int_Sucursal_Id) AND ([Int_Moneda_Id] = @Original_Int_Moneda_Id) AND ([Fecha_Creacion] = @Original_Fecha_Creacion) AND ([Creacion_Per_Personal_Id] = @Original_Creacion_Per_Personal_Id) AND ([Fecha_Update] = @Original_Fecha_Update) AND ([Update_Per_Personal_Id] = @Original_Update_Per_Personal_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))
