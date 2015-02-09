CREATE PROCEDURE dbo.Dic_Pantalla_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Estado char(3),
	@Dic_Rotulo_Id varchar(17),
	@Tool_Dic_Rotulo_Id varchar(17)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Dic_Pantalla] ([Id], [Codigo], [Nombre], [Estado], [Dic_Rotulo_Id], [Tool_Dic_Rotulo_Id]) VALUES (@Id, @Codigo, @Nombre, @Estado, @Dic_Rotulo_Id, @Tool_Dic_Rotulo_Id);
	
SELECT Id, Codigo, Nombre, Estado, Dic_Rotulo_Id, Tool_Dic_Rotulo_Id FROM Dic_Pantalla WHERE (Id = @Id)