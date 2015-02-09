CREATE PROCEDURE dbo.Par_Mensaje_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Codigo_Mensaje varchar(200),
	@Nombre varchar(500),
	@Tipo char(3),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Par_Mensaje] ([Id], [Codigo], [Codigo_Mensaje], [Nombre], [Tipo], [Estado]) VALUES (@Id, @Codigo, @Codigo_Mensaje, @Nombre, @Tipo, @Estado);
	
SELECT Id, Codigo, Codigo_Mensaje, Nombre, Tipo, Estado FROM Par_Mensaje WHERE (Id = @Id)