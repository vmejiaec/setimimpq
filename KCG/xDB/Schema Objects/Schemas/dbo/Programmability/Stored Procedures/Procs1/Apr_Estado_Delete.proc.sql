CREATE PROCEDURE dbo.Apr_Estado_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_Dominio char(3),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(2000)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Apr_Estado] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Dominio] = @Original_Dominio) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)))