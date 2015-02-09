CREATE PROCEDURE dbo.Apr_Documento_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Abreviatura varchar(50),
	@Dic_Campo_id varchar(17),
	@Estado char(3),
	@Descripcion varchar(2000),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@IsNull_Abreviatura Int,
	@Original_Abreviatura varchar(50),
	@Original_Dic_Campo_id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(2000)
)
AS
	SET NOCOUNT OFF;
UPDATE [Apr_Documento] SET [Id] = @Id, [Codigo] = @Codigo, [Nombre] = @Nombre, [Abreviatura] = @Abreviatura, [Dic_Campo_id] = @Dic_Campo_id, [Estado] = @Estado, [Descripcion] = @Descripcion WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ((@IsNull_Abreviatura = 1 AND [Abreviatura] IS NULL) OR ([Abreviatura] = @Original_Abreviatura)) AND ([Dic_Campo_id] = @Original_Dic_Campo_id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)));
	
SELECT Id, Codigo, Nombre, Abreviatura, Dic_Campo_id, Estado, Descripcion FROM Apr_Documento WHERE (Id = @Id)