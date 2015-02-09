CREATE PROCEDURE dbo.Dic_Par_Paginacion_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Dic_Objeto_Id varchar(17),
	@Par_Servidor_Id varchar(17),
	@Limite_registros int,
	@Numero_usuarios int,
	@Umbral int,
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Dic_Par_Paginacion] ([Id], [Codigo], [Dic_Objeto_Id], [Par_Servidor_Id], [Limite_registros], [Numero_usuarios], [Umbral], [Estado]) VALUES (@Id, @Codigo, @Dic_Objeto_Id, @Par_Servidor_Id, @Limite_registros, @Numero_usuarios, @Umbral, @Estado);
	
SELECT Id, Codigo, Dic_Objeto_Id, Par_Servidor_Id, Limite_registros, Numero_usuarios, Umbral, Estado FROM Dic_Par_Paginacion WHERE (Id = @Id)