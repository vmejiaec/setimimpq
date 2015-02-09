CREATE PROCEDURE dbo.Ver_Dominio_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Ver_Version_id varchar(17),
	@Dic_Dominio_id varchar(17),
	@Estado char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_Ver_Version_id varchar(17),
	@Original_Dic_Dominio_id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
UPDATE [Ver_Dominio] SET [Id] = @Id, [Codigo] = @Codigo, [Nombre] = @Nombre, [Ver_Version_id] = @Ver_Version_id, [Dic_Dominio_id] = @Dic_Dominio_id, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Ver_Version_id] = @Original_Ver_Version_id) AND ([Dic_Dominio_id] = @Original_Dic_Dominio_id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Nombre, Ver_Version_id, Dic_Dominio_id, Estado FROM Ver_Dominio WHERE (Id = @Id)