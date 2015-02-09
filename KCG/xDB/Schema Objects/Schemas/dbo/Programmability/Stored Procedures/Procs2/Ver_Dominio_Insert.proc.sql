CREATE PROCEDURE dbo.Ver_Dominio_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Ver_Version_id varchar(17),
	@Dic_Dominio_id varchar(17),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Ver_Dominio] ([Id], [Codigo], [Nombre], [Ver_Version_id], [Dic_Dominio_id], [Estado]) VALUES (@Id, @Codigo, @Nombre, @Ver_Version_id, @Dic_Dominio_id, @Estado);
	
SELECT Id, Codigo, Nombre, Ver_Version_id, Dic_Dominio_id, Estado FROM Ver_Dominio WHERE (Id = @Id)