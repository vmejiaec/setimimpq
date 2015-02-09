CREATE PROCEDURE [dbo].[Apu_Material_Delete]
(
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
DELETE FROM [Apu_Material] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Unidad] = @Original_Unidad) AND ([Costo_Parcial] = @Original_Costo_Parcial) AND ([Costo_Otros] = @Original_Costo_Otros) AND ([Costo_Transporte] = @Original_Costo_Transporte) AND ([Disponible] = @Original_Disponible) AND ([Int_Sucursal_Id] = @Original_Int_Sucursal_Id) AND ([Int_Moneda_Id] = @Original_Int_Moneda_Id) AND ([Fecha_Creacion] = @Original_Fecha_Creacion) AND ([Creacion_Per_Personal_Id] = @Original_Creacion_Per_Personal_Id) AND ([Fecha_Update] = @Original_Fecha_Update) AND ([Update_Per_Personal_Id] = @Original_Update_Per_Personal_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))
