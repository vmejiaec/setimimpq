CREATE PROCEDURE dbo.Apu_Proyecto_Rubro_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Proyecto_Id varchar(17),
	@Apu_Rubro_Id varchar(17),
	@Cantidad numeric(17, 4),
	@Rendimiento_Mano_Obra numeric(17, 6),
	@Rendimiento_Equipo numeric(17, 6),
	@Apu_Subtitulo_Id varchar(17),
	@Estado char(3),
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
UPDATE [Apu_Proyecto_Rubro] SET [Id] = @Id, [Codigo] = @Codigo, [Apu_Proyecto_Id] = @Apu_Proyecto_Id, [Apu_Rubro_Id] = @Apu_Rubro_Id, [Cantidad] = @Cantidad, [Rendimiento_Mano_Obra] = @Rendimiento_Mano_Obra, [Rendimiento_Equipo] = @Rendimiento_Equipo, [Apu_Subtitulo_Id] = @Apu_Subtitulo_Id, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Apu_Proyecto_Id] = @Original_Apu_Proyecto_Id) AND ([Apu_Rubro_Id] = @Original_Apu_Rubro_Id) AND ([Cantidad] = @Original_Cantidad) AND ([Rendimiento_Mano_Obra] = @Original_Rendimiento_Mano_Obra) AND ([Rendimiento_Equipo] = @Original_Rendimiento_Equipo) AND ([Apu_Subtitulo_Id] = @Original_Apu_Subtitulo_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Apu_Proyecto_Id, Apu_Rubro_Id, Cantidad, Rendimiento_Mano_Obra, Rendimiento_Equipo, Apu_Subtitulo_Id, Estado FROM Apu_Proyecto_Rubro WHERE (Id = @Id)