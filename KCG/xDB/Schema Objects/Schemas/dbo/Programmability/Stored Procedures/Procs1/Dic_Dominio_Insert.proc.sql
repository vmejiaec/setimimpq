CREATE PROCEDURE dbo.Dic_Dominio_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Dic_Campo_Id varchar(17),
	@Dominio varchar(3),
	@Nombre varchar(500),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Dic_Dominio] ([Id], [Codigo], [Dic_Campo_Id], [Dominio], [Nombre], [Estado]) VALUES (@Id, @Codigo, @Dic_Campo_Id, @Dominio, @Nombre, @Estado);
	
SELECT Id, Codigo, Dic_Campo_Id, Dominio, Nombre, Estado FROM Dic_Dominio WHERE (Id = @Id)