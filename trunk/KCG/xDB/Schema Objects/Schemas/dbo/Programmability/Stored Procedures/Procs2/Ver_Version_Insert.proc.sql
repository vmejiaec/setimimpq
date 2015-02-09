CREATE PROCEDURE dbo.Ver_Version_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Abreviatura varchar(10),
	@Predeterminada varchar(3),
	@Ruta_Imagen varchar(500),
	@Estado char(3),
	@Descripcion varchar(2000)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Ver_Version] ([Id], [Codigo], [Nombre], [Abreviatura], [Predeterminada], [Ruta_Imagen], [Estado], [Descripcion]) VALUES (@Id, @Codigo, @Nombre, @Abreviatura, @Predeterminada, @Ruta_Imagen, @Estado, @Descripcion);
	
SELECT Id, Codigo, Nombre, Abreviatura, Predeterminada, Ruta_Imagen, Estado, Descripcion FROM Ver_Version WHERE (Id = @Id)