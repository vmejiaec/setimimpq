CREATE PROCEDURE [dbo].[Apu_Rubro_Delete]
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_Unidad varchar(200),
	@Original_Int_Sucursal_Id varchar(17),
	@Original_Apu_Subtitulo_Id varchar(17),
	@Original_Int_Moneda_Id varchar(17),
	@Original_Rendimiento_Mano_Obra numeric(17, 6),
	@Original_Rendimiento_Equipo numeric(17, 6),
	@Original_Especial varchar(3),
	@Original_Disponible varchar(3),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(4000),
	@Original_Creacion_Per_Personal_Id varchar(17),
	@Original_Fecha_Creacion smalldatetime,
	@Original_Update_Per_Personal_Id varchar(17),
	@Original_Fecha_Update smalldatetime,
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Apu_Rubro] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Unidad] = @Original_Unidad) AND ([Int_Sucursal_Id] = @Original_Int_Sucursal_Id) AND ([Apu_Subtitulo_Id] = @Original_Apu_Subtitulo_Id) AND ([Int_Moneda_Id] = @Original_Int_Moneda_Id) AND ([Rendimiento_Mano_Obra] = @Original_Rendimiento_Mano_Obra) AND ([Rendimiento_Equipo] = @Original_Rendimiento_Equipo) AND ([Especial] = @Original_Especial) AND ([Disponible] = @Original_Disponible) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)) AND ([Creacion_Per_Personal_Id] = @Original_Creacion_Per_Personal_Id) AND ([Fecha_Creacion] = @Original_Fecha_Creacion) AND ([Update_Per_Personal_Id] = @Original_Update_Per_Personal_Id) AND ([Fecha_Update] = @Original_Fecha_Update) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))
