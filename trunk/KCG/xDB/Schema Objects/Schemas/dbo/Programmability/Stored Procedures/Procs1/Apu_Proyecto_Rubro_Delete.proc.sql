CREATE PROCEDURE dbo.Apu_Proyecto_Rubro_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Apu_Proyecto_Id varchar(17),
	@Original_Apu_Rubro_Id varchar(17),
	@Original_Cantidad numeric(17, 4),
	@Original_Rendimiento_Mano_Obra numeric(17, 6),
	@Original_Rendimiento_Equipo numeric(17, 6),
	@Original_Apu_Subtitulo_Id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Apu_Proyecto_Rubro] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Apu_Proyecto_Id] = @Original_Apu_Proyecto_Id) AND ([Apu_Rubro_Id] = @Original_Apu_Rubro_Id) AND ([Cantidad] = @Original_Cantidad) AND ([Rendimiento_Mano_Obra] = @Original_Rendimiento_Mano_Obra) AND ([Rendimiento_Equipo] = @Original_Rendimiento_Equipo) AND ([Apu_Subtitulo_Id] = @Original_Apu_Subtitulo_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))