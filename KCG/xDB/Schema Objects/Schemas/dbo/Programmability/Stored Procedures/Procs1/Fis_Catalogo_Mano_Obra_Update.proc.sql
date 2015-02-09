CREATE PROCEDURE dbo.Fis_Catalogo_Mano_Obra_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Fis_Catalogo_Id varchar(17),
	@Apu_Categoria_Id varchar(17),
	@Apu_Mano_Obra_Id varchar(17),
	@Valor numeric(17, 2),
	@Estado char(3),
	@Descripcion varchar(2000),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Fis_Catalogo_Id varchar(17),
	@IsNull_Apu_Categoria_Id Int,
	@Original_Apu_Categoria_Id varchar(17),
	@Original_Apu_Mano_Obra_Id varchar(17),
	@Original_Valor numeric(17, 2),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(2000)
)
AS
	SET NOCOUNT OFF;
UPDATE [Fis_Catalogo_Mano_Obra] SET [Id] = @Id, [Codigo] = @Codigo, [Fis_Catalogo_Id] = @Fis_Catalogo_Id, [Apu_Categoria_Id] = @Apu_Categoria_Id, [Apu_Mano_Obra_Id] = @Apu_Mano_Obra_Id, [Valor] = @Valor, [Estado] = @Estado, [Descripcion] = @Descripcion WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Fis_Catalogo_Id] = @Original_Fis_Catalogo_Id) AND ((@IsNull_Apu_Categoria_Id = 1 AND [Apu_Categoria_Id] IS NULL) OR ([Apu_Categoria_Id] = @Original_Apu_Categoria_Id)) AND ([Apu_Mano_Obra_Id] = @Original_Apu_Mano_Obra_Id) AND ([Valor] = @Original_Valor) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)));
	
SELECT Id, Codigo, Fis_Catalogo_Id, Apu_Categoria_Id, Apu_Mano_Obra_Id, Valor, Estado, Descripcion FROM Fis_Catalogo_Mano_Obra WHERE (Id = @Id)