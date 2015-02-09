CREATE PROCEDURE dbo.Ver_Mensaje_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_Ver_Version_Id varchar(17),
	@Original_Par_Mensaje_Id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Ver_Mensaje] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Ver_Version_Id] = @Original_Ver_Version_Id) AND ([Par_Mensaje_Id] = @Original_Par_Mensaje_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))