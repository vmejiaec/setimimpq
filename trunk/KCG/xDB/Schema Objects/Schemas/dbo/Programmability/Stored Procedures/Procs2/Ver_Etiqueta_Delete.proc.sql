CREATE PROCEDURE dbo.Ver_Etiqueta_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_Ver_Version_Id varchar(17),
	@Original_Dic_Rotulo_Id varchar(17),
	@IsNull_Imagen_Activa Int,
	@Original_Imagen_Activa varchar(500),
	@IsNull_Imagen_Desactiva Int,
	@Original_Imagen_Desactiva varchar(500),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Ver_Etiqueta] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Ver_Version_Id] = @Original_Ver_Version_Id) AND ([Dic_Rotulo_Id] = @Original_Dic_Rotulo_Id) AND ((@IsNull_Imagen_Activa = 1 AND [Imagen_Activa] IS NULL) OR ([Imagen_Activa] = @Original_Imagen_Activa)) AND ((@IsNull_Imagen_Desactiva = 1 AND [Imagen_Desactiva] IS NULL) OR ([Imagen_Desactiva] = @Original_Imagen_Desactiva)) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))