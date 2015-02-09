CREATE PROCEDURE dbo.Dic_Codigo_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Tipo char(3),
	@Orden int,
	@Dic_Campo_Id varchar(17),
	@Act_Dic_Campo_id varchar(17),
	@Ref_Dic_Campo_Id varchar(17),
	@Dic_Secuencia_Id varchar(17),
	@Pre_Dic_Campo_Id varchar(17),
	@Constante varchar(200),
	@Funcion varchar(8000),
	@Estado char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Tipo char(3),
	@Original_Orden int,
	@Original_Dic_Campo_Id varchar(17),
	@IsNull_Act_Dic_Campo_id Int,
	@Original_Act_Dic_Campo_id varchar(17),
	@IsNull_Ref_Dic_Campo_Id Int,
	@Original_Ref_Dic_Campo_Id varchar(17),
	@IsNull_Dic_Secuencia_Id Int,
	@Original_Dic_Secuencia_Id varchar(17),
	@IsNull_Pre_Dic_Campo_Id Int,
	@Original_Pre_Dic_Campo_Id varchar(17),
	@IsNull_Constante Int,
	@Original_Constante varchar(200),
	@IsNull_Funcion Int,
	@Original_Funcion varchar(8000),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
UPDATE [Dic_Codigo] SET [Id] = @Id, [Codigo] = @Codigo, [Tipo] = @Tipo, [Orden] = @Orden, [Dic_Campo_Id] = @Dic_Campo_Id, [Act_Dic_Campo_id] = @Act_Dic_Campo_id, [Ref_Dic_Campo_Id] = @Ref_Dic_Campo_Id, [Dic_Secuencia_Id] = @Dic_Secuencia_Id, [Pre_Dic_Campo_Id] = @Pre_Dic_Campo_Id, [Constante] = @Constante, [Funcion] = @Funcion, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Tipo] = @Original_Tipo) AND ([Orden] = @Original_Orden) AND ([Dic_Campo_Id] = @Original_Dic_Campo_Id) AND ((@IsNull_Act_Dic_Campo_id = 1 AND [Act_Dic_Campo_id] IS NULL) OR ([Act_Dic_Campo_id] = @Original_Act_Dic_Campo_id)) AND ((@IsNull_Ref_Dic_Campo_Id = 1 AND [Ref_Dic_Campo_Id] IS NULL) OR ([Ref_Dic_Campo_Id] = @Original_Ref_Dic_Campo_Id)) AND ((@IsNull_Dic_Secuencia_Id = 1 AND [Dic_Secuencia_Id] IS NULL) OR ([Dic_Secuencia_Id] = @Original_Dic_Secuencia_Id)) AND ((@IsNull_Pre_Dic_Campo_Id = 1 AND [Pre_Dic_Campo_Id] IS NULL) OR ([Pre_Dic_Campo_Id] = @Original_Pre_Dic_Campo_Id)) AND ((@IsNull_Constante = 1 AND [Constante] IS NULL) OR ([Constante] = @Original_Constante)) AND ((@IsNull_Funcion = 1 AND [Funcion] IS NULL) OR ([Funcion] = @Original_Funcion)) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Tipo, Orden, Dic_Campo_Id, Act_Dic_Campo_id, Ref_Dic_Campo_Id, Dic_Secuencia_Id, Pre_Dic_Campo_Id, Constante, Funcion, Estado FROM Dic_Codigo WHERE (Id = @Id)