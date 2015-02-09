CREATE PROCEDURE dbo.Dic_Par_Paginacion_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Dic_Objeto_Id varchar(17),
	@Original_Par_Servidor_Id varchar(17),
	@Original_Limite_registros int,
	@Original_Numero_usuarios int,
	@Original_Umbral int,
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Dic_Par_Paginacion] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Dic_Objeto_Id] = @Original_Dic_Objeto_Id) AND ([Par_Servidor_Id] = @Original_Par_Servidor_Id) AND ([Limite_registros] = @Original_Limite_registros) AND ([Numero_usuarios] = @Original_Numero_usuarios) AND ([Umbral] = @Original_Umbral) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))