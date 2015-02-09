CREATE PROCEDURE [dbo].[Apr_Doc_Estado_Insert]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apr_Estado_Id varchar(17),
	@Apr_Documento_Id varchar(17),
	@Orden int,
	@Estado char(3),
	@Descripcion varchar(2000)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apr_Doc_Estado] ([Id], [Codigo], [Apr_Estado_Id], [Apr_Documento_Id], [Orden], [Estado], [Descripcion]) VALUES (@Id, @Codigo, @Apr_Estado_Id, @Apr_Documento_Id, @Orden, @Estado, @Descripcion);
	
SELECT Id, Codigo, Apr_Estado_Id, Apr_Documento_Id, Orden, Estado, Descripcion FROM Apr_Doc_Estado WHERE (Id = @Id)
