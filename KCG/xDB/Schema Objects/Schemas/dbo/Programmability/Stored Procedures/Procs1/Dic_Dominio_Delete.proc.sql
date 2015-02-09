CREATE PROCEDURE dbo.Dic_Dominio_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Dic_Campo_Id varchar(17),
	@Original_Dominio varchar(3),
	@Original_Nombre varchar(500),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Dic_Dominio] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Dic_Campo_Id] = @Original_Dic_Campo_Id) AND ([Dominio] = @Original_Dominio) AND ([Nombre] = @Original_Nombre) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))