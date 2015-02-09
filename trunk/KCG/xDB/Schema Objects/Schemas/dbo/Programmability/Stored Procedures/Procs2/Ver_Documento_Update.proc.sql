CREATE PROCEDURE dbo.Ver_Documento_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Apr_Documento_Id varchar(17),
	@Ver_Version_id varchar(17),
	@Estado char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_Apr_Documento_Id varchar(17),
	@Original_Ver_Version_id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
UPDATE [Ver_Documento] SET [Id] = @Id, [Codigo] = @Codigo, [Nombre] = @Nombre, [Apr_Documento_Id] = @Apr_Documento_Id, [Ver_Version_id] = @Ver_Version_id, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Apr_Documento_Id] = @Original_Apr_Documento_Id) AND ([Ver_Version_id] = @Original_Ver_Version_id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Nombre, Apr_Documento_Id, Ver_Version_id, Estado FROM Ver_Documento WHERE (Id = @Id)