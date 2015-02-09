CREATE PROCEDURE dbo.Dic_General_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_Tipo char(3),
	@IsNull_Dominio Int,
	@Original_Dominio char(3),
	@Original_Orden int,
	@IsNull_Dic_Rotulo_Id Int,
	@Original_Dic_Rotulo_Id varchar(17),
	@IsNull_Tool_Dic_Rotulo_id Int,
	@Original_Tool_Dic_Rotulo_id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(10)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Dic_General] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Tipo] = @Original_Tipo) AND ((@IsNull_Dominio = 1 AND [Dominio] IS NULL) OR ([Dominio] = @Original_Dominio)) AND ([Orden] = @Original_Orden) AND ((@IsNull_Dic_Rotulo_Id = 1 AND [Dic_Rotulo_Id] IS NULL) OR ([Dic_Rotulo_Id] = @Original_Dic_Rotulo_Id)) AND ((@IsNull_Tool_Dic_Rotulo_id = 1 AND [Tool_Dic_Rotulo_id] IS NULL) OR ([Tool_Dic_Rotulo_id] = @Original_Tool_Dic_Rotulo_id)) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))