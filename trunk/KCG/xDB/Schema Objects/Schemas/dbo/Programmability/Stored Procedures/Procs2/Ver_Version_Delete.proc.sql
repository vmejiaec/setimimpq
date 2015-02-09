CREATE PROCEDURE dbo.Ver_Version_Delete
(
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
DELETE FROM [Ver_Version] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Abreviatura] = @Original_Abreviatura) AND ([Predeterminada] = @Original_Predeterminada) AND ([Ruta_Imagen] = @Original_Ruta_Imagen) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)))