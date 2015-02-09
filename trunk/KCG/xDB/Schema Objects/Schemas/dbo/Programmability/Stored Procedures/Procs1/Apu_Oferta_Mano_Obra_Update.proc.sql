CREATE PROCEDURE dbo.Apu_Oferta_Mano_Obra_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Oferta_Id varchar(17),
	@Apu_Mano_Obra_Id varchar(17),
	@Apu_Categoria_Id varchar(17),
	@Apu_Indice_Id varchar(17),
	@Estado char(3),
	@Costo_Diario numeric(17, 4),
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
UPDATE [Apu_Oferta_Mano_Obra] SET [Id] = @Id, [Codigo] = @Codigo, [Apu_Oferta_Id] = @Apu_Oferta_Id, [Apu_Mano_Obra_Id] = @Apu_Mano_Obra_Id, [Apu_Categoria_Id] = @Apu_Categoria_Id, [Apu_Indice_Id] = @Apu_Indice_Id, [Estado] = @Estado, [Costo_Diario] = @Costo_Diario WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Apu_Oferta_Id] = @Original_Apu_Oferta_Id) AND ([Apu_Mano_Obra_Id] = @Original_Apu_Mano_Obra_Id) AND ((@IsNull_Apu_Categoria_Id = 1 AND [Apu_Categoria_Id] IS NULL) OR ([Apu_Categoria_Id] = @Original_Apu_Categoria_Id)) AND ([Apu_Indice_Id] = @Original_Apu_Indice_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ([Costo_Diario] = @Original_Costo_Diario));
	
SELECT Id, Codigo, Apu_Oferta_Id, Apu_Mano_Obra_Id, Apu_Categoria_Id, Apu_Indice_Id, Estado, Costo_Diario FROM Apu_Oferta_Mano_Obra WHERE (Id = @Id)