CREATE PROCEDURE dbo.Apu_Parametros_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@IsNull_Equipo_Apu_Indice_Id Int,
	@Original_Equipo_Apu_Indice_Id varchar(17),
	@IsNull_ManoObra_Apu_Indice_Id Int,
	@Original_ManoObra_Apu_Indice_Id varchar(17),
	@Original_Porcentaje_Costo_Indirecto numeric(5, 2),
	@Original_Int_Sucursal_Id varchar(17),
	@IsNull_Apu_Mano_Obra_Id Int,
	@Original_Apu_Mano_Obra_Id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@IsNull_Apu_Subtitulo_Id_Oferta_Rubro_Pred Int,
	@Original_Apu_Subtitulo_Id_Oferta_Rubro_Pred varchar(17)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Apu_Parametros] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ((@IsNull_Equipo_Apu_Indice_Id = 1 AND [Equipo_Apu_Indice_Id] IS NULL) OR ([Equipo_Apu_Indice_Id] = @Original_Equipo_Apu_Indice_Id)) AND ((@IsNull_ManoObra_Apu_Indice_Id = 1 AND [ManoObra_Apu_Indice_Id] IS NULL) OR ([ManoObra_Apu_Indice_Id] = @Original_ManoObra_Apu_Indice_Id)) AND ([Porcentaje_Costo_Indirecto] = @Original_Porcentaje_Costo_Indirecto) AND ([Int_Sucursal_Id] = @Original_Int_Sucursal_Id) AND ((@IsNull_Apu_Mano_Obra_Id = 1 AND [Apu_Mano_Obra_Id] IS NULL) OR ([Apu_Mano_Obra_Id] = @Original_Apu_Mano_Obra_Id)) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Apu_Subtitulo_Id_Oferta_Rubro_Pred = 1 AND [Apu_Subtitulo_Id_Oferta_Rubro_Pred] IS NULL) OR ([Apu_Subtitulo_Id_Oferta_Rubro_Pred] = @Original_Apu_Subtitulo_Id_Oferta_Rubro_Pred)))