CREATE PROCEDURE dbo.Par_Mensaje_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Codigo_Mensaje varchar(200),
	@Original_Nombre varchar(500),
	@Original_Tipo char(3),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Par_Mensaje] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Codigo_Mensaje] = @Original_Codigo_Mensaje) AND ([Nombre] = @Original_Nombre) AND ([Tipo] = @Original_Tipo) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))