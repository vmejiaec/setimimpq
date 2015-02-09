CREATE PROCEDURE dbo.Ver_Mensaje_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Ver_Version_Id varchar(17),
	@Par_Mensaje_Id varchar(17),
	@Estado char(3),
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
UPDATE [Ver_Mensaje] SET [Id] = @Id, [Codigo] = @Codigo, [Nombre] = @Nombre, [Ver_Version_Id] = @Ver_Version_Id, [Par_Mensaje_Id] = @Par_Mensaje_Id, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Ver_Version_Id] = @Original_Ver_Version_Id) AND ([Par_Mensaje_Id] = @Original_Par_Mensaje_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Nombre, Ver_Version_Id, Par_Mensaje_Id, Estado FROM Ver_Mensaje WHERE (Id = @Id)