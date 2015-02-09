CREATE PROCEDURE dbo.Ver_Documento_Delete
(
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
DELETE FROM [Ver_Documento] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Apr_Documento_Id] = @Original_Apr_Documento_Id) AND ([Ver_Version_id] = @Original_Ver_Version_id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))