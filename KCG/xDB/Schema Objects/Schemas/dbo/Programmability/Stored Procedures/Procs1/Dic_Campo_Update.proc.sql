CREATE PROCEDURE dbo.Dic_Campo_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Dic_Objeto_Id varchar(17),
	@Tipo_Dato char(3),
	@Tipo_Constraint char(3),
	@Filtro varchar(3),
	@Estado char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_Dic_Objeto_Id varchar(17),
	@Original_Tipo_Dato char(3),
	@Original_Tipo_Constraint char(3),
	@Original_Filtro varchar(3),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
UPDATE [Dic_Campo] SET [Id] = @Id, [Codigo] = @Codigo, [Nombre] = @Nombre, [Dic_Objeto_Id] = @Dic_Objeto_Id, [Tipo_Dato] = @Tipo_Dato, [Tipo_Constraint] = @Tipo_Constraint, [Filtro] = @Filtro, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Dic_Objeto_Id] = @Original_Dic_Objeto_Id) AND ([Tipo_Dato] = @Original_Tipo_Dato) AND ([Tipo_Constraint] = @Original_Tipo_Constraint) AND ([Filtro] = @Original_Filtro) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Nombre, Dic_Objeto_Id, Tipo_Dato, Tipo_Constraint, Filtro, Estado FROM Dic_Campo WHERE (Id = @Id)