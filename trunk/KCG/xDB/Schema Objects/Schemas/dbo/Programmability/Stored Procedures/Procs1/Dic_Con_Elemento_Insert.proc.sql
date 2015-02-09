CREATE PROCEDURE dbo.Dic_Con_Elemento_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Tipo char(3),
	@Nombre varchar(500),
	@Dic_Contenedor_id varchar(17),
	@Dic_Rotulo_id varchar(17),
	@Tool_Dic_Rotulo_Id varchar(17),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Dic_Con_Elemento] ([Id], [Codigo], [Tipo], [Nombre], [Dic_Contenedor_id], [Dic_Rotulo_id], [Tool_Dic_Rotulo_Id], [Estado]) VALUES (@Id, @Codigo, @Tipo, @Nombre, @Dic_Contenedor_id, @Dic_Rotulo_id, @Tool_Dic_Rotulo_Id, @Estado);
	
SELECT Id, Codigo, Tipo, Nombre, Dic_Contenedor_id, Dic_Rotulo_id, Tool_Dic_Rotulo_Id, Estado FROM Dic_Con_Elemento WHERE (Id = @Id)