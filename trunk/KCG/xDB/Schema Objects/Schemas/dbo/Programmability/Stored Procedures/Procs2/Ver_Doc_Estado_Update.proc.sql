CREATE PROCEDURE [dbo].[Ver_Doc_Estado_Update]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Ver_Version_Id varchar(17),
	@Estado char(3),
	@Apr_Doc_Estado_Id varchar(17),
	@Descripcion varchar(2000),
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
UPDATE [Ver_Doc_Estado] SET [Id] = @Id, [Codigo] = @Codigo, [Nombre] = @Nombre, [Ver_Version_Id] = @Ver_Version_Id, [Estado] = @Estado, [Apr_Doc_Estado_Id] = @Apr_Doc_Estado_Id, [Descripcion] = @Descripcion WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Ver_Version_Id] = @Original_Ver_Version_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ([Apr_Doc_Estado_Id] = @Original_Apr_Doc_Estado_Id) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)));
	
SELECT Id, Codigo, Nombre, Ver_Version_Id, Estado, Apr_Doc_Estado_Id, Descripcion FROM Ver_Doc_Estado WHERE (Id = @Id)

