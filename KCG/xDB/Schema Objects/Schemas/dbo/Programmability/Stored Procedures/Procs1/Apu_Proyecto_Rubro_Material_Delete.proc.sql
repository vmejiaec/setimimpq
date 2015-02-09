CREATE PROCEDURE dbo.Apu_Proyecto_Rubro_Material_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Apu_Proyecto_Rubro_Id varchar(17),
	@Original_Apu_Material_Id varchar(17),
	@Original_Cantidad numeric(17, 4),
	@IsNull_Fecha_Creacion Int,
	@Original_Fecha_Creacion smalldatetime,
	@Original_Creacion_Per_Personal_Id varchar(17),
	@Original_Fecha_Update smalldatetime,
	@Original_Update_Per_Personal_Id varchar(17),
	@IsNull_Fecha_UpdateTransporte Int,
	@Original_Fecha_UpdateTransporte smalldatetime,
	@IsNull_UpdateTransporte_Per_Personal_Id Int,
	@Original_UpdateTransporte_Per_Personal_Id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Apu_Proyecto_Rubro_Material] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Apu_Proyecto_Rubro_Id] = @Original_Apu_Proyecto_Rubro_Id) AND ([Apu_Material_Id] = @Original_Apu_Material_Id) AND ([Cantidad] = @Original_Cantidad) AND ((@IsNull_Fecha_Creacion = 1 AND [Fecha_Creacion] IS NULL) OR ([Fecha_Creacion] = @Original_Fecha_Creacion)) AND ([Creacion_Per_Personal_Id] = @Original_Creacion_Per_Personal_Id) AND ([Fecha_Update] = @Original_Fecha_Update) AND ([Update_Per_Personal_Id] = @Original_Update_Per_Personal_Id) AND ((@IsNull_Fecha_UpdateTransporte = 1 AND [Fecha_UpdateTransporte] IS NULL) OR ([Fecha_UpdateTransporte] = @Original_Fecha_UpdateTransporte)) AND ((@IsNull_UpdateTransporte_Per_Personal_Id = 1 AND [UpdateTransporte_Per_Personal_Id] IS NULL) OR ([UpdateTransporte_Per_Personal_Id] = @Original_UpdateTransporte_Per_Personal_Id)) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))