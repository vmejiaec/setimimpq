CREATE PROCEDURE dbo.Par_Servidor_Det_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Par_Servidor_Id varchar(17),
	@Dic_Contenedor_Id varchar(17),
	@Referencia varchar(500),
	@Estado char(3),
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
UPDATE [Par_Servidor_Det] SET [Id] = @Id, [Codigo] = @Codigo, [Par_Servidor_Id] = @Par_Servidor_Id, [Dic_Contenedor_Id] = @Dic_Contenedor_Id, [Referencia] = @Referencia, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Par_Servidor_Id] = @Original_Par_Servidor_Id) AND ([Dic_Contenedor_Id] = @Original_Dic_Contenedor_Id) AND ([Referencia] = @Original_Referencia) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Par_Servidor_Id, Dic_Contenedor_Id, Referencia, Estado FROM Par_Servidor_Det WHERE (Id = @Id)