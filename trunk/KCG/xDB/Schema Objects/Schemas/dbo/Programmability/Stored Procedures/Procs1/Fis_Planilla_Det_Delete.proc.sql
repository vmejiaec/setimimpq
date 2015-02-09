CREATE PROCEDURE dbo.Fis_Planilla_Det_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(2000),
	@IsNull_Apu_Prespuesto_Rubro_Id Int,
	@Original_Apu_Prespuesto_Rubro_Id varchar(17),
	@IsNull_Apu_Rubro_Codigo Int,
	@Original_Apu_Rubro_Codigo varchar(200),
	@IsNull_Apu_Rubro_Nombre Int,
	@Original_Apu_Rubro_Nombre varchar(500),
	@Original_Apu_Rubro_Unidad varchar(500),
	@Original_Costo numeric(17, 4),
	@Original_Cantidad numeric(17, 2),
	@IsNull_Fis_Planilla_Id Int,
	@Original_Fis_Planilla_Id varchar(17)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Fis_Planilla_Det] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)) AND ((@IsNull_Apu_Prespuesto_Rubro_Id = 1 AND [Apu_Prespuesto_Rubro_Id] IS NULL) OR ([Apu_Prespuesto_Rubro_Id] = @Original_Apu_Prespuesto_Rubro_Id)) AND ((@IsNull_Apu_Rubro_Codigo = 1 AND [Apu_Rubro_Codigo] IS NULL) OR ([Apu_Rubro_Codigo] = @Original_Apu_Rubro_Codigo)) AND ((@IsNull_Apu_Rubro_Nombre = 1 AND [Apu_Rubro_Nombre] IS NULL) OR ([Apu_Rubro_Nombre] = @Original_Apu_Rubro_Nombre)) AND ([Apu_Rubro_Unidad] = @Original_Apu_Rubro_Unidad) AND ([Costo] = @Original_Costo) AND ([Cantidad] = @Original_Cantidad) AND ((@IsNull_Fis_Planilla_Id = 1 AND [Fis_Planilla_Id] IS NULL) OR ([Fis_Planilla_Id] = @Original_Fis_Planilla_Id)))