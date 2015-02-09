CREATE PROCEDURE dbo.Par_Servidor_Det_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Par_Servidor_Id varchar(17),
	@Original_Dic_Contenedor_Id varchar(17),
	@Original_Referencia varchar(500),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Par_Servidor_Det] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Par_Servidor_Id] = @Original_Par_Servidor_Id) AND ([Dic_Contenedor_Id] = @Original_Dic_Contenedor_Id) AND ([Referencia] = @Original_Referencia) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))