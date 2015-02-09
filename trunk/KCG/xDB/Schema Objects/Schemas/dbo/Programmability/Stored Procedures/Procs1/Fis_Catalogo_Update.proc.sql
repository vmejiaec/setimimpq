CREATE PROCEDURE [dbo].[Fis_Catalogo_Update]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Estado char(3),
	@Descripcion varchar(2000),
	@Int_Empresa_Id varchar(17),
	@Fecha_Creacion smalldatetime,
	@Creacion_Per_Personal_Id varchar(17),
	@Fecha_Publicacion smalldatetime,
	@Nombre varchar(500),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(2000),
	@Original_Int_Empresa_Id varchar(17),
	@Original_Fecha_Creacion smalldatetime,
	@Original_Creacion_Per_Personal_Id varchar(17),
	@Original_Fecha_Publicacion smalldatetime,
	@IsNull_Nombre Int,
	@Original_Nombre varchar(500)
)
AS
	SET NOCOUNT OFF;
UPDATE [Fis_Catalogo] SET [Id] = @Id, [Codigo] = @Codigo, [Estado] = @Estado, [Descripcion] = @Descripcion, [Int_Empresa_Id] = @Int_Empresa_Id, [Fecha_Creacion] = @Fecha_Creacion, [Creacion_Per_Personal_Id] = @Creacion_Per_Personal_Id, [Fecha_Publicacion] = @Fecha_Publicacion, [Nombre] = @Nombre WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)) AND ([Int_Empresa_Id] = @Original_Int_Empresa_Id) AND ([Fecha_Creacion] = @Original_Fecha_Creacion) AND ([Creacion_Per_Personal_Id] = @Original_Creacion_Per_Personal_Id) AND ([Fecha_Publicacion] = @Original_Fecha_Publicacion) AND ((@IsNull_Nombre = 1 AND [Nombre] IS NULL) OR ([Nombre] = @Original_Nombre)));
	
SELECT Id, Codigo, Estado, Descripcion, Int_Empresa_Id, Fecha_Creacion, Creacion_Per_Personal_Id, Fecha_Publicacion, Nombre FROM Fis_Catalogo WHERE (Id = @Id)