CREATE PROCEDURE dbo.Ver_Documento_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Apr_Documento_Id varchar(17),
	@Ver_Version_id varchar(17),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Ver_Documento] ([Id], [Codigo], [Nombre], [Apr_Documento_Id], [Ver_Version_id], [Estado]) VALUES (@Id, @Codigo, @Nombre, @Apr_Documento_Id, @Ver_Version_id, @Estado);
	
SELECT Id, Codigo, Nombre, Apr_Documento_Id, Ver_Version_id, Estado FROM Ver_Documento WHERE (Id = @Id)