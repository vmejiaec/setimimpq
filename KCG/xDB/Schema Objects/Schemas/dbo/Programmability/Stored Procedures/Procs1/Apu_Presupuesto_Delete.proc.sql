CREATE PROCEDURE dbo.Apu_Presupuesto_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Apu_Origen_Id varchar(17),
	@Original_Apu_Origen_Codigo varchar(200),
	@Original_Apu_Origen_Nombre varchar(500),
	@Original_Origen char(3),
	@Original_Costo_Directo numeric(17, 4),
	@Original_Costo_Total numeric(17, 4),
	@Original_Costo_Indirecto numeric(17, 4),
	@Original_Costo_Otros numeric(17, 4),
	@IsNull_Equipo_Apu_Indice_Id Int,
	@Original_Equipo_Apu_Indice_Id varchar(17),
	@IsNull_ManoObra_Apu_Indice_Id Int,
	@Original_ManoObra_Apu_Indice_Id varchar(170),
	@Original_Porcentaje_Costo_Indirecto numeric(5, 2),
	@Original_Int_Sucursal_Id varchar(17),
	@IsNull_Apu_Mano_Obra_Id Int,
	@Original_Apu_Mano_Obra_Id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@IsNull_Fiscalizador_Per_Personal_Id Int,
	@Original_Fiscalizador_Per_Personal_Id varchar(17),
	@IsNull_Contratista_Per_Personal_Id Int,
	@Original_Contratista_Per_Personal_Id varchar(17),
	@IsNull_Fecha_Indices_Def Int,
	@Original_Fecha_Indices_Def smalldatetime,
	@Original_Fecha_Creacion smalldatetime,
	@Original_Creacion_Per_Personal_Id varchar(17),
	@Original_Fecha_Update smalldatetime,
	@Original_Update_Per_Personal_Id varchar(17),
	@IsNull_Tipo Int,
	@Original_Tipo char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Apu_Presupuesto] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Apu_Origen_Id] = @Original_Apu_Origen_Id) AND ([Apu_Origen_Codigo] = @Original_Apu_Origen_Codigo) AND ([Apu_Origen_Nombre] = @Original_Apu_Origen_Nombre) AND ([Origen] = @Original_Origen) AND ([Costo_Directo] = @Original_Costo_Directo) AND ([Costo_Total] = @Original_Costo_Total) AND ([Costo_Indirecto] = @Original_Costo_Indirecto) AND ([Costo_Otros] = @Original_Costo_Otros) AND ((@IsNull_Equipo_Apu_Indice_Id = 1 AND [Equipo_Apu_Indice_Id] IS NULL) OR ([Equipo_Apu_Indice_Id] = @Original_Equipo_Apu_Indice_Id)) AND ((@IsNull_ManoObra_Apu_Indice_Id = 1 AND [ManoObra_Apu_Indice_Id] IS NULL) OR ([ManoObra_Apu_Indice_Id] = @Original_ManoObra_Apu_Indice_Id)) AND ([Porcentaje_Costo_Indirecto] = @Original_Porcentaje_Costo_Indirecto) AND ([Int_Sucursal_Id] = @Original_Int_Sucursal_Id) AND ((@IsNull_Apu_Mano_Obra_Id = 1 AND [Apu_Mano_Obra_Id] IS NULL) OR ([Apu_Mano_Obra_Id] = @Original_Apu_Mano_Obra_Id)) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Fiscalizador_Per_Personal_Id = 1 AND [Fiscalizador_Per_Personal_Id] IS NULL) OR ([Fiscalizador_Per_Personal_Id] = @Original_Fiscalizador_Per_Personal_Id)) AND ((@IsNull_Contratista_Per_Personal_Id = 1 AND [Contratista_Per_Personal_Id] IS NULL) OR ([Contratista_Per_Personal_Id] = @Original_Contratista_Per_Personal_Id)) AND ((@IsNull_Fecha_Indices_Def = 1 AND [Fecha_Indices_Def] IS NULL) OR ([Fecha_Indices_Def] = @Original_Fecha_Indices_Def)) AND ([Fecha_Creacion] = @Original_Fecha_Creacion) AND ([Creacion_Per_Personal_Id] = @Original_Creacion_Per_Personal_Id) AND ([Fecha_Update] = @Original_Fecha_Update) AND ([Update_Per_Personal_Id] = @Original_Update_Per_Personal_Id) AND ((@IsNull_Tipo = 1 AND [Tipo] IS NULL) OR ([Tipo] = @Original_Tipo)))