CREATE PROCEDURE dbo.Dic_Paginacion_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Dic_Objeto_Id varchar(17),
	@Par_Servidor_Id varchar(17),
	@Id_Inicial varchar(17),
	@Id_Final varchar(17),
	@Secuencia int,
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Dic_Paginacion] ([Id], [Codigo], [Dic_Objeto_Id], [Par_Servidor_Id], [Id_Inicial], [Id_Final], [Secuencia], [Estado]) VALUES (@Id, @Codigo, @Dic_Objeto_Id, @Par_Servidor_Id, @Id_Inicial, @Id_Final, @Secuencia, @Estado);
	
SELECT Id, Codigo, Dic_Objeto_Id, Par_Servidor_Id, Id_Inicial, Id_Final, Secuencia, Estado FROM Dic_Paginacion WHERE (Id = @Id)