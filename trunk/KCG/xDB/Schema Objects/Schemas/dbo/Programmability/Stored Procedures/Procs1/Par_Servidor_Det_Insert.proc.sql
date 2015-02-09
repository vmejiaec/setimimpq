CREATE PROCEDURE dbo.Par_Servidor_Det_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Par_Servidor_Id varchar(17),
	@Dic_Contenedor_Id varchar(17),
	@Referencia varchar(500),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Par_Servidor_Det] ([Id], [Codigo], [Par_Servidor_Id], [Dic_Contenedor_Id], [Referencia], [Estado]) VALUES (@Id, @Codigo, @Par_Servidor_Id, @Dic_Contenedor_Id, @Referencia, @Estado);
	
SELECT Id, Codigo, Par_Servidor_Id, Dic_Contenedor_Id, Referencia, Estado FROM Par_Servidor_Det WHERE (Id = @Id)