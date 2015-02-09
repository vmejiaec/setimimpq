CREATE PROCEDURE dbo.Dic_Rotulo_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Dic_Rotulo] ([Id], [Codigo], [Nombre], [Estado]) VALUES (@Id, @Codigo, @Nombre, @Estado);
	
SELECT Id, Codigo, Nombre, Estado FROM Dic_Rotulo WHERE (Id = @Id)