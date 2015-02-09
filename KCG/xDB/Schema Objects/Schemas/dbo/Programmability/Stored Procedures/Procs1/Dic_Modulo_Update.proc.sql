CREATE PROCEDURE dbo.Dic_Modulo_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Estado char(3),
	@Descripcion varchar(2000),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(2000)
)
AS
	SET NOCOUNT OFF;
UPDATE [Dic_Modulo] SET [Id] = @Id, [Codigo] = @Codigo, [Nombre] = @Nombre, [Estado] = @Estado, [Descripcion] = @Descripcion WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)));
	
SELECT Id, Codigo, Nombre, Estado, Descripcion FROM Dic_Modulo WHERE (Id = @Id)