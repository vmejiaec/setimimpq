CREATE PROCEDURE [dbo].[Apu_Proyecto_Mano_Obra_Update]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Costo_Diario numeric(17, 4),
	@Apu_Proyecto_Id varchar(17),
	@Apu_Mano_Obra_Id varchar(17),
	@Apu_Indice_Id varchar(17),
	@Apu_Categoria_Id varchar(17),
	@Estado char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Costo_Diario numeric(17, 4),
	@Original_Apu_Proyecto_Id varchar(17),
	@Original_Apu_Mano_Obra_Id varchar(17),
	@IsNull_Apu_Indice_Id Int,
	@Original_Apu_Indice_Id varchar(17),
	@IsNull_Apu_Categoria_Id Int,
	@Original_Apu_Categoria_Id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;

if not( @Apu_Categoria_Id is null)
	
	set @Costo_Diario = dbo._Apu_Proyecto_Categoria_Costo_Diario ( dbo._Apu_Proyecto_Categoria_Id(@Apu_Proyecto_Id,@Apu_Categoria_Id))


UPDATE [Apu_Proyecto_Mano_Obra] SET [Id] = @Id, [Codigo] = @Codigo, [Costo_Diario] = @Costo_Diario, [Apu_Proyecto_Id] = @Apu_Proyecto_Id, [Apu_Mano_Obra_Id] = @Apu_Mano_Obra_Id, [Apu_Indice_Id] = @Apu_Indice_Id, [Apu_Categoria_Id] = @Apu_Categoria_Id, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Costo_Diario] = @Original_Costo_Diario) AND ([Apu_Proyecto_Id] = @Original_Apu_Proyecto_Id) AND ([Apu_Mano_Obra_Id] = @Original_Apu_Mano_Obra_Id) AND ((@IsNull_Apu_Indice_Id = 1 AND [Apu_Indice_Id] IS NULL) OR ([Apu_Indice_Id] = @Original_Apu_Indice_Id)) AND ((@IsNull_Apu_Categoria_Id = 1 AND [Apu_Categoria_Id] IS NULL) OR ([Apu_Categoria_Id] = @Original_Apu_Categoria_Id)) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Costo_Diario, Apu_Proyecto_Id, Apu_Mano_Obra_Id, Apu_Indice_Id, Apu_Categoria_Id, Estado FROM Apu_Proyecto_Mano_Obra WHERE (Id = @Id)

