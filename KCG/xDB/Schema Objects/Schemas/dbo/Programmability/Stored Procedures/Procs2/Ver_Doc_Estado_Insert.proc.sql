CREATE PROCEDURE [dbo].[Ver_Doc_Estado_Insert]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Ver_Version_Id varchar(17),
	@Estado char(3),
	@Apr_Doc_Estado_Id varchar(17),
	@Descripcion varchar(2000)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Ver_Doc_Estado] ([Id], [Codigo], [Nombre], [Ver_Version_Id], [Estado], [Apr_Doc_Estado_Id], [Descripcion]) VALUES (@Id, @Codigo, @Nombre, @Ver_Version_Id, @Estado, @Apr_Doc_Estado_Id, @Descripcion);
	
SELECT Id, Codigo, Nombre, Ver_Version_Id, Estado, Apr_Doc_Estado_Id, Descripcion FROM Ver_Doc_Estado WHERE (Id = @Id)

