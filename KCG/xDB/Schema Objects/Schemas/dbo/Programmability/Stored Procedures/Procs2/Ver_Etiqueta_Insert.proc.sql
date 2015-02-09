CREATE PROCEDURE dbo.Ver_Etiqueta_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Ver_Version_Id varchar(17),
	@Dic_Rotulo_Id varchar(17),
	@Imagen_Activa varchar(500),
	@Imagen_Desactiva varchar(500),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Ver_Etiqueta] ([Id], [Codigo], [Nombre], [Ver_Version_Id], [Dic_Rotulo_Id], [Imagen_Activa], [Imagen_Desactiva], [Estado]) VALUES (@Id, @Codigo, @Nombre, @Ver_Version_Id, @Dic_Rotulo_Id, @Imagen_Activa, @Imagen_Desactiva, @Estado);
	
SELECT Id, Codigo, Nombre, Ver_Version_Id, Dic_Rotulo_Id, Imagen_Activa, Imagen_Desactiva, Estado FROM Ver_Etiqueta WHERE (Id = @Id)