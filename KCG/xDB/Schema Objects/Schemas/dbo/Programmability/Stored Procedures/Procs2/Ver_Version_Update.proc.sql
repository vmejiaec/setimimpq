CREATE PROCEDURE dbo.Ver_Version_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Abreviatura varchar(10),
	@Predeterminada varchar(3),
	@Ruta_Imagen varchar(500),
	@Estado char(3),
	@Descripcion varchar(2000),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_Abreviatura varchar(10),
	@Original_Predeterminada varchar(3),
	@Original_Ruta_Imagen varchar(500),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(2000)
)
AS
	SET NOCOUNT OFF;
UPDATE [Ver_Version] SET [Id] = @Id, [Codigo] = @Codigo, [Nombre] = @Nombre, [Abreviatura] = @Abreviatura, [Predeterminada] = @Predeterminada, [Ruta_Imagen] = @Ruta_Imagen, [Estado] = @Estado, [Descripcion] = @Descripcion WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Abreviatura] = @Original_Abreviatura) AND ([Predeterminada] = @Original_Predeterminada) AND ([Ruta_Imagen] = @Original_Ruta_Imagen) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)));
	
SELECT Id, Codigo, Nombre, Abreviatura, Predeterminada, Ruta_Imagen, Estado, Descripcion FROM Ver_Version WHERE (Id = @Id)