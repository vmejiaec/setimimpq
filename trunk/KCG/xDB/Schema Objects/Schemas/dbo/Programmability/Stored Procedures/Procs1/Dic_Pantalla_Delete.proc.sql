CREATE PROCEDURE dbo.Dic_Pantalla_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@Original_Dic_Rotulo_Id varchar(17),
	@Original_Tool_Dic_Rotulo_Id varchar(17)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Dic_Pantalla] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ([Dic_Rotulo_Id] = @Original_Dic_Rotulo_Id) AND ([Tool_Dic_Rotulo_Id] = @Original_Tool_Dic_Rotulo_Id))