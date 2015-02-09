CREATE PROCEDURE dbo.Dic_General_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Tipo char(3),
	@Dominio char(3),
	@Orden int,
	@Dic_Rotulo_Id varchar(17),
	@Tool_Dic_Rotulo_id varchar(17),
	@Estado char(10)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Dic_General] ([Id], [Codigo], [Nombre], [Tipo], [Dominio], [Orden], [Dic_Rotulo_Id], [Tool_Dic_Rotulo_id], [Estado]) VALUES (@Id, @Codigo, @Nombre, @Tipo, @Dominio, @Orden, @Dic_Rotulo_Id, @Tool_Dic_Rotulo_id, @Estado);
	
SELECT Id, Codigo, Nombre, Tipo, Dominio, Orden, Dic_Rotulo_Id, Tool_Dic_Rotulo_id, Estado FROM Dic_General WHERE (Id = @Id)