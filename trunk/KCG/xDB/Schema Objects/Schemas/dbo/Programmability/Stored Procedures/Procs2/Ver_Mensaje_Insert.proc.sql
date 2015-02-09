CREATE PROCEDURE dbo.Ver_Mensaje_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Ver_Version_Id varchar(17),
	@Par_Mensaje_Id varchar(17),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Ver_Mensaje] ([Id], [Codigo], [Nombre], [Ver_Version_Id], [Par_Mensaje_Id], [Estado]) VALUES (@Id, @Codigo, @Nombre, @Ver_Version_Id, @Par_Mensaje_Id, @Estado);
	
SELECT Id, Codigo, Nombre, Ver_Version_Id, Par_Mensaje_Id, Estado FROM Ver_Mensaje WHERE (Id = @Id)