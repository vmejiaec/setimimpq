CREATE PROCEDURE [dbo].[Fis_Catalogo_Delete]
(
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
DELETE FROM [Fis_Catalogo] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)) AND ([Int_Empresa_Id] = @Original_Int_Empresa_Id) AND ([Fecha_Creacion] = @Original_Fecha_Creacion) AND ([Creacion_Per_Personal_Id] = @Original_Creacion_Per_Personal_Id) AND ([Fecha_Publicacion] = @Original_Fecha_Publicacion) AND ((@IsNull_Nombre = 1 AND [Nombre] IS NULL) OR ([Nombre] = @Original_Nombre)))