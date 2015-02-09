CREATE PROCEDURE dbo.Dic_Modulo_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Estado char(3),
	@Descripcion varchar(2000)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Dic_Modulo] ([Id], [Codigo], [Nombre], [Estado], [Descripcion]) VALUES (@Id, @Codigo, @Nombre, @Estado, @Descripcion);
	
SELECT Id, Codigo, Nombre, Estado, Descripcion FROM Dic_Modulo WHERE (Id = @Id)