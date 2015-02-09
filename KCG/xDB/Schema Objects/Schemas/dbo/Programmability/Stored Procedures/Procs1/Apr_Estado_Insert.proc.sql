CREATE PROCEDURE dbo.Apr_Estado_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Dominio char(3),
	@Estado char(3),
	@Descripcion varchar(2000)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apr_Estado] ([Id], [Codigo], [Nombre], [Dominio], [Estado], [Descripcion]) VALUES (@Id, @Codigo, @Nombre, @Dominio, @Estado, @Descripcion);
	
SELECT Id, Codigo, Nombre, Dominio, Estado, Descripcion FROM Apr_Estado WHERE (Id = @Id)