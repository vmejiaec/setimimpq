CREATE PROCEDURE [dbo].[Fis_Catalogo_Insert]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Estado char(3),
	@Descripcion varchar(2000),
	@Int_Empresa_Id varchar(17),
	@Fecha_Creacion smalldatetime,
	@Creacion_Per_Personal_Id varchar(17),
	@Fecha_Publicacion smalldatetime,
	@Nombre varchar(500)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Fis_Catalogo] ([Id], [Codigo], [Estado], [Descripcion], [Int_Empresa_Id], [Fecha_Creacion], [Creacion_Per_Personal_Id], [Fecha_Publicacion], [Nombre]) VALUES (@Id, @Codigo, @Estado, @Descripcion, @Int_Empresa_Id, @Fecha_Creacion, @Creacion_Per_Personal_Id, @Fecha_Publicacion, @Nombre);
	
SELECT Id, Codigo, Estado, Descripcion, Int_Empresa_Id, Fecha_Creacion, Creacion_Per_Personal_Id, Fecha_Publicacion, Nombre FROM Fis_Catalogo WHERE (Id = @Id)