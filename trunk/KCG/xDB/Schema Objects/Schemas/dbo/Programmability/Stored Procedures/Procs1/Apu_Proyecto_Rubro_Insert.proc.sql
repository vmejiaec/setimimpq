CREATE PROCEDURE dbo.Apu_Proyecto_Rubro_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Proyecto_Id varchar(17),
	@Apu_Rubro_Id varchar(17),
	@Cantidad numeric(17, 4),
	@Rendimiento_Mano_Obra numeric(17, 6),
	@Rendimiento_Equipo numeric(17, 6),
	@Apu_Subtitulo_Id varchar(17),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apu_Proyecto_Rubro] ([Id], [Codigo], [Apu_Proyecto_Id], [Apu_Rubro_Id], [Cantidad], [Rendimiento_Mano_Obra], [Rendimiento_Equipo], [Apu_Subtitulo_Id], [Estado]) VALUES (@Id, @Codigo, @Apu_Proyecto_Id, @Apu_Rubro_Id, @Cantidad, @Rendimiento_Mano_Obra, @Rendimiento_Equipo, @Apu_Subtitulo_Id, @Estado);
	
SELECT Id, Codigo, Apu_Proyecto_Id, Apu_Rubro_Id, Cantidad, Rendimiento_Mano_Obra, Rendimiento_Equipo, Apu_Subtitulo_Id, Estado FROM Apu_Proyecto_Rubro WHERE (Id = @Id)