CREATE PROCEDURE dbo.Apu_Oferta_Categoria_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Oferta_Id varchar(17),
	@Apu_Categoria_Id varchar(17),
	@Costo_Diario numeric(17, 4),
	@Estado char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Apu_Oferta_Id varchar(17),
	@Original_Apu_Categoria_Id varchar(17),
	@Original_Costo_Diario numeric(17, 4),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
UPDATE [Apu_Oferta_Categoria] SET [Id] = @Id, [Codigo] = @Codigo, [Apu_Oferta_Id] = @Apu_Oferta_Id, [Apu_Categoria_Id] = @Apu_Categoria_Id, [Costo_Diario] = @Costo_Diario, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Apu_Oferta_Id] = @Original_Apu_Oferta_Id) AND ([Apu_Categoria_Id] = @Original_Apu_Categoria_Id) AND ([Costo_Diario] = @Original_Costo_Diario) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Apu_Oferta_Id, Apu_Categoria_Id, Costo_Diario, Estado FROM Apu_Oferta_Categoria WHERE (Id = @Id)