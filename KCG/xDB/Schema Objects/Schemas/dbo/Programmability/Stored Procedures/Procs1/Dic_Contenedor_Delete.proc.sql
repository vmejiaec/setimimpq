CREATE PROCEDURE dbo.Dic_Contenedor_Delete
(
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
DELETE FROM [Dic_Contenedor] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ([Tipo] = @Original_Tipo) AND ([Dic_Modulo_id] = @Original_Dic_Modulo_id) AND ([Filtro] = @Original_Filtro))