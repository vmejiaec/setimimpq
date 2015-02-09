CREATE PROCEDURE [dbo].[Apu_Rubro_Documento_Update]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Rubro_Id varchar(17),
	@Nombre varchar(500),
	@Ruta varchar(2000),
	@Descripcion varchar(2000),
	@Estado char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Apu_Rubro_Id varchar(17),
	@Original_Nombre varchar(500),
	@Original_Ruta varchar(2000),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(2000),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
SET @Descripcion = UPPER(@Descripcion)
UPDATE [Apu_Rubro_Documento] SET [Id] = @Id, [Codigo] = @Codigo, [Apu_Rubro_Id] = @Apu_Rubro_Id, [Nombre] = @Nombre, [Ruta] = @Ruta, [Descripcion] = @Descripcion, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Apu_Rubro_Id] = @Original_Apu_Rubro_Id) AND ([Nombre] = @Original_Nombre) AND ([Ruta] = @Original_Ruta) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Apu_Rubro_Id, Nombre, Ruta, Descripcion, Estado FROM Apu_Rubro_Documento WHERE (Id = @Id)
