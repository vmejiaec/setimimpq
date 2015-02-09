CREATE PROCEDURE [dbo].[Apr_Doc_Estado_Delete]
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Apr_Estado_Id varchar(17),
	@Original_Apr_Documento_Id varchar(17),
	@Original_Orden int,
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(2000)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Apr_Doc_Estado] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Apr_Estado_Id] = @Original_Apr_Estado_Id) AND ([Apr_Documento_Id] = @Original_Apr_Documento_Id) AND ([Orden] = @Original_Orden) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)))
