CREATE PROCEDURE dbo.Dic_Dominio_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Dic_Campo_Id varchar(17),
	@Dominio varchar(3),
	@Nombre varchar(500),
	@Estado char(3),
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
UPDATE [Dic_Dominio] SET [Id] = @Id, [Codigo] = @Codigo, [Dic_Campo_Id] = @Dic_Campo_Id, [Dominio] = @Dominio, [Nombre] = @Nombre, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Dic_Campo_Id] = @Original_Dic_Campo_Id) AND ([Dominio] = @Original_Dominio) AND ([Nombre] = @Original_Nombre) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Dic_Campo_Id, Dominio, Nombre, Estado FROM Dic_Dominio WHERE (Id = @Id)