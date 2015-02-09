CREATE PROCEDURE dbo.Dic_Con_Campo_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Dic_Con_Objeto_Id varchar(17),
	@Dic_Campo_Id varchar(17),
	@Dic_Rotulo_Id varchar(17),
	@Tool_Dic_Rotulo_Id varchar(17),
	@Ancho int,
	@Orden int,
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Dic_Con_Campo] ([Id], [Codigo], [Dic_Con_Objeto_Id], [Dic_Campo_Id], [Dic_Rotulo_Id], [Tool_Dic_Rotulo_Id], [Ancho], [Orden], [Estado]) VALUES (@Id, @Codigo, @Dic_Con_Objeto_Id, @Dic_Campo_Id, @Dic_Rotulo_Id, @Tool_Dic_Rotulo_Id, @Ancho, @Orden, @Estado);
	
SELECT Id, Codigo, Dic_Con_Objeto_Id, Dic_Campo_Id, Dic_Rotulo_Id, Tool_Dic_Rotulo_Id, Ancho, Orden, Estado FROM Dic_Con_Campo WHERE (Id = @Id)