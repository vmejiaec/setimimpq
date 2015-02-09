CREATE PROCEDURE dbo.Dic_Paginacion_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Dic_Objeto_Id varchar(17),
	@Original_Par_Servidor_Id varchar(17),
	@Original_Id_Inicial varchar(17),
	@Original_Id_Final varchar(17),
	@Original_Secuencia int,
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Dic_Paginacion] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Dic_Objeto_Id] = @Original_Dic_Objeto_Id) AND ([Par_Servidor_Id] = @Original_Par_Servidor_Id) AND ([Id_Inicial] = @Original_Id_Inicial) AND ([Id_Final] = @Original_Id_Final) AND ([Secuencia] = @Original_Secuencia) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))