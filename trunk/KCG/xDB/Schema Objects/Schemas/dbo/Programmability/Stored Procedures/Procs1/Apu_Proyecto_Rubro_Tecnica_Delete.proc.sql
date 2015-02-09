CREATE PROCEDURE dbo.Apu_Proyecto_Rubro_Tecnica_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Apu_Proyecto_Rubro_Id varchar(17),
	@IsNull_Imagen Int,
	@Original_Imagen varchar(500),
	@IsNull_Origen_Imagen Int,
	@Original_Origen_Imagen varchar(4000),
	@IsNull_Definicion Int,
	@Original_Definicion varchar(4000),
	@IsNull_Especificacion Int,
	@Original_Especificacion varchar(4000),
	@IsNull_Medicion Int,
	@Original_Medicion varchar(4000),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Apu_Proyecto_Rubro_Tecnica] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Apu_Proyecto_Rubro_Id] = @Original_Apu_Proyecto_Rubro_Id) AND ((@IsNull_Imagen = 1 AND [Imagen] IS NULL) OR ([Imagen] = @Original_Imagen)) AND ((@IsNull_Origen_Imagen = 1 AND [Origen_Imagen] IS NULL) OR ([Origen_Imagen] = @Original_Origen_Imagen)) AND ((@IsNull_Definicion = 1 AND [Definicion] IS NULL) OR ([Definicion] = @Original_Definicion)) AND ((@IsNull_Especificacion = 1 AND [Especificacion] IS NULL) OR ([Especificacion] = @Original_Especificacion)) AND ((@IsNull_Medicion = 1 AND [Medicion] IS NULL) OR ([Medicion] = @Original_Medicion)) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))