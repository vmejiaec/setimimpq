CREATE PROCEDURE dbo.Dic_Con_Elemento_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Tipo char(3),
	@Original_Nombre varchar(500),
	@Original_Dic_Contenedor_id varchar(17),
	@Original_Dic_Rotulo_id varchar(17),
	@Original_Tool_Dic_Rotulo_Id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Dic_Con_Elemento] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Tipo] = @Original_Tipo) AND ([Nombre] = @Original_Nombre) AND ([Dic_Contenedor_id] = @Original_Dic_Contenedor_id) AND ([Dic_Rotulo_id] = @Original_Dic_Rotulo_id) AND ([Tool_Dic_Rotulo_Id] = @Original_Tool_Dic_Rotulo_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))