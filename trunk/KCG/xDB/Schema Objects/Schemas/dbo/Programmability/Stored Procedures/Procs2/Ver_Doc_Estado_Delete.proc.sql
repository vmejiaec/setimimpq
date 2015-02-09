CREATE PROCEDURE [dbo].[Ver_Doc_Estado_Delete]
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_Ver_Version_Id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@Original_Apr_Doc_Estado_Id varchar(17),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(2000)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Ver_Doc_Estado] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Ver_Version_Id] = @Original_Ver_Version_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ([Apr_Doc_Estado_Id] = @Original_Apr_Doc_Estado_Id) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)))

