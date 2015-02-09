CREATE PROCEDURE dbo.Dic_Objeto_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Dic_Modulo_Id varchar(17),
	@Numero int,
	@Estado char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_Dic_Modulo_Id varchar(17),
	@Original_Numero int,
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
UPDATE [Dic_Objeto] SET [Id] = @Id, [Codigo] = @Codigo, [Nombre] = @Nombre, [Dic_Modulo_Id] = @Dic_Modulo_Id, [Numero] = @Numero, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Dic_Modulo_Id] = @Original_Dic_Modulo_Id) AND ([Numero] = @Original_Numero) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Nombre, Dic_Modulo_Id, Numero, Estado FROM Dic_Objeto WHERE (Id = @Id)