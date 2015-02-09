CREATE PROCEDURE dbo.Apu_Oferta_Mano_Obra_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Apu_Oferta_Id varchar(17),
	@Original_Apu_Mano_Obra_Id varchar(17),
	@IsNull_Apu_Categoria_Id Int,
	@Original_Apu_Categoria_Id varchar(17),
	@Original_Apu_Indice_Id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@Original_Costo_Diario numeric(17, 4)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Apu_Oferta_Mano_Obra] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Apu_Oferta_Id] = @Original_Apu_Oferta_Id) AND ([Apu_Mano_Obra_Id] = @Original_Apu_Mano_Obra_Id) AND ((@IsNull_Apu_Categoria_Id = 1 AND [Apu_Categoria_Id] IS NULL) OR ([Apu_Categoria_Id] = @Original_Apu_Categoria_Id)) AND ([Apu_Indice_Id] = @Original_Apu_Indice_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ([Costo_Diario] = @Original_Costo_Diario))