CREATE PROCEDURE dbo.Par_Servidor_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Descripcion varchar(2000),
	@Ruta varchar(500),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Par_Servidor] ([Id], [Codigo], [Nombre], [Descripcion], [Ruta], [Estado]) VALUES (@Id, @Codigo, @Nombre, @Descripcion, @Ruta, @Estado);
	
SELECT Id, Codigo, Nombre, Descripcion, Ruta, Estado FROM Par_Servidor WHERE (Id = @Id)