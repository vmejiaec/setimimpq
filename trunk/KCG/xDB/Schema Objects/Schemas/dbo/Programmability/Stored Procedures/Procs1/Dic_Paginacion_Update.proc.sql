CREATE PROCEDURE dbo.Dic_Paginacion_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Dic_Objeto_Id varchar(17),
	@Par_Servidor_Id varchar(17),
	@Id_Inicial varchar(17),
	@Id_Final varchar(17),
	@Secuencia int,
	@Estado char(3),
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
UPDATE [Dic_Paginacion] SET [Id] = @Id, [Codigo] = @Codigo, [Dic_Objeto_Id] = @Dic_Objeto_Id, [Par_Servidor_Id] = @Par_Servidor_Id, [Id_Inicial] = @Id_Inicial, [Id_Final] = @Id_Final, [Secuencia] = @Secuencia, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Dic_Objeto_Id] = @Original_Dic_Objeto_Id) AND ([Par_Servidor_Id] = @Original_Par_Servidor_Id) AND ([Id_Inicial] = @Original_Id_Inicial) AND ([Id_Final] = @Original_Id_Final) AND ([Secuencia] = @Original_Secuencia) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Dic_Objeto_Id, Par_Servidor_Id, Id_Inicial, Id_Final, Secuencia, Estado FROM Dic_Paginacion WHERE (Id = @Id)