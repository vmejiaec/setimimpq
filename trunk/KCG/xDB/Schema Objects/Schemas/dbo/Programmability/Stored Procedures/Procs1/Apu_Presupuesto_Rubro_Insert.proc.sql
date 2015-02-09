CREATE PROCEDURE dbo.Apu_Presupuesto_Rubro_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Estado char(3),
	@Descripcion varchar(2000),
	@Apu_Presupuesto_Id varchar(17),
	@Apu_Rubro_id varchar(17),
	@Apu_Rubro_Codigo varchar(200),
	@Apu_Rubro_Nombre varchar(500),
	@Apu_Rubro_Unidad varchar(200),
	@Apu_Rubro_Cantidad numeric(17, 2),
	@Costo_Unitario numeric(17, 4),
	@Costo_Total numeric(17, 4),
	@Apu_Subtitulo_Id varchar(17)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apu_Presupuesto_Rubro] ([Id], [Codigo], [Estado], [Descripcion], [Apu_Presupuesto_Id], [Apu_Rubro_id], [Apu_Rubro_Codigo], [Apu_Rubro_Nombre], [Apu_Rubro_Unidad], [Apu_Rubro_Cantidad], [Costo_Unitario], [Costo_Total], [Apu_Subtitulo_Id]) VALUES (@Id, @Codigo, @Estado, @Descripcion, @Apu_Presupuesto_Id, @Apu_Rubro_id, @Apu_Rubro_Codigo, @Apu_Rubro_Nombre, @Apu_Rubro_Unidad, @Apu_Rubro_Cantidad, @Costo_Unitario, @Costo_Total, @Apu_Subtitulo_Id);
	
SELECT Id, Codigo, Estado, Descripcion, Apu_Presupuesto_Id, Apu_Rubro_id, Apu_Rubro_Codigo, Apu_Rubro_Nombre, Apu_Rubro_Unidad, Apu_Rubro_Cantidad, Costo_Unitario, Costo_Total, Apu_Subtitulo_Id FROM Apu_Presupuesto_Rubro WHERE (Id = @Id)