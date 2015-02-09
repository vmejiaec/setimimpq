CREATE PROCEDURE dbo.Dic_Contenedor_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Estado char(3),
	@Tipo char(3),
	@Dic_Modulo_id varchar(17),
	@Filtro varchar(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Dic_Contenedor] ([Id], [Codigo], [Nombre], [Estado], [Tipo], [Dic_Modulo_id], [Filtro]) VALUES (@Id, @Codigo, @Nombre, @Estado, @Tipo, @Dic_Modulo_id, @Filtro);
	
SELECT Id, Codigo, Nombre, Estado, Tipo, Dic_Modulo_id, Filtro FROM Dic_Contenedor WHERE (Id = @Id)