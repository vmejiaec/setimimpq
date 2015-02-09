CREATE PROCEDURE dbo.Fis_Catalogo_Categoria_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Fis_Catalogo_Id varchar(17),
	@Apu_Categoria_Id varchar(17),
	@Valor numeric(17, 4),
	@Estado char(3),
	@Descripcion varchar(2000),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Fis_Catalogo_Id varchar(17),
	@Original_Apu_Categoria_Id varchar(17),
	@Original_Valor numeric(17, 4),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(2000)
)
AS
	SET NOCOUNT OFF;
UPDATE [Fis_Catalogo_Categoria] SET [Id] = @Id, [Codigo] = @Codigo, [Fis_Catalogo_Id] = @Fis_Catalogo_Id, [Apu_Categoria_Id] = @Apu_Categoria_Id, [Valor] = @Valor, [Estado] = @Estado, [Descripcion] = @Descripcion WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Fis_Catalogo_Id] = @Original_Fis_Catalogo_Id) AND ([Apu_Categoria_Id] = @Original_Apu_Categoria_Id) AND ([Valor] = @Original_Valor) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)));
	
SELECT Id, Codigo, Fis_Catalogo_Id, Apu_Categoria_Id, Valor, Estado, Descripcion FROM Fis_Catalogo_Categoria WHERE (Id = @Id)