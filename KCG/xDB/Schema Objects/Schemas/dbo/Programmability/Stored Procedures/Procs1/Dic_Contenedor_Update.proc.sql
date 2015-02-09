CREATE PROCEDURE dbo.Dic_Contenedor_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Estado char(3),
	@Tipo char(3),
	@Dic_Modulo_id varchar(17),
	@Filtro varchar(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@Original_Tipo char(3),
	@Original_Dic_Modulo_id varchar(17),
	@Original_Filtro varchar(3)
)
AS
	SET NOCOUNT OFF;
UPDATE [Dic_Contenedor] SET [Id] = @Id, [Codigo] = @Codigo, [Nombre] = @Nombre, [Estado] = @Estado, [Tipo] = @Tipo, [Dic_Modulo_id] = @Dic_Modulo_id, [Filtro] = @Filtro WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ([Tipo] = @Original_Tipo) AND ([Dic_Modulo_id] = @Original_Dic_Modulo_id) AND ([Filtro] = @Original_Filtro));
	
SELECT Id, Codigo, Nombre, Estado, Tipo, Dic_Modulo_id, Filtro FROM Dic_Contenedor WHERE (Id = @Id)