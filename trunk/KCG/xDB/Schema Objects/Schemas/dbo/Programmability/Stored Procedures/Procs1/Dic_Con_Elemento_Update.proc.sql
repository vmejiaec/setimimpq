CREATE PROCEDURE dbo.Dic_Con_Elemento_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Tipo char(3),
	@Nombre varchar(500),
	@Dic_Contenedor_id varchar(17),
	@Dic_Rotulo_id varchar(17),
	@Tool_Dic_Rotulo_Id varchar(17),
	@Estado char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Tipo char(3),
	@Original_Nombre varchar(500),
	@Original_Dic_Contenedor_id varchar(17),
	@Original_Dic_Rotulo_id varchar(17),
	@Original_Tool_Dic_Rotulo_Id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
UPDATE [Dic_Con_Elemento] SET [Id] = @Id, [Codigo] = @Codigo, [Tipo] = @Tipo, [Nombre] = @Nombre, [Dic_Contenedor_id] = @Dic_Contenedor_id, [Dic_Rotulo_id] = @Dic_Rotulo_id, [Tool_Dic_Rotulo_Id] = @Tool_Dic_Rotulo_Id, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Tipo] = @Original_Tipo) AND ([Nombre] = @Original_Nombre) AND ([Dic_Contenedor_id] = @Original_Dic_Contenedor_id) AND ([Dic_Rotulo_id] = @Original_Dic_Rotulo_id) AND ([Tool_Dic_Rotulo_Id] = @Original_Tool_Dic_Rotulo_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Tipo, Nombre, Dic_Contenedor_id, Dic_Rotulo_id, Tool_Dic_Rotulo_Id, Estado FROM Dic_Con_Elemento WHERE (Id = @Id)