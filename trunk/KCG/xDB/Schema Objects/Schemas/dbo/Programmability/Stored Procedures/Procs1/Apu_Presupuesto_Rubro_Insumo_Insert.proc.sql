CREATE PROCEDURE dbo.Apu_Presupuesto_Rubro_Insumo_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Estado char(3),
	@Descripcion varchar(2000),
	@Origen char(3),
	@Apu_Origen_Id varchar(17),
	@Apu_Rubro_Id varchar(17),
	@Apu_Rubro_Codigo varchar(200),
	@Apu_Rubro_Nombre varchar(500),
	@Apu_Rubro_Cantidad numeric(17, 2),
	@Apu_Rubro_Unidad varchar(200),
	@Insumo char(3),
	@Apu_Insumo_Id varchar(17),
	@Apu_Insumo_Codigo varchar(200),
	@Apu_Insumo_Nombre varchar(500),
	@Apu_Categoria_Id varchar(17),
	@Apu_Categoria_Codigo varchar(200),
	@Apu_Categoria_Nombre varchar(500),
	@Costo_Diario numeric(17, 4),
	@Rendimiento numeric(17, 4),
	@Cantidad numeric(17, 4)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apu_Presupuesto_Rubro_Insumo] ([Id], [Codigo], [Estado], [Descripcion], [Origen], [Apu_Origen_Id], [Apu_Rubro_Id], [Apu_Rubro_Codigo], [Apu_Rubro_Nombre], [Apu_Rubro_Cantidad], [Apu_Rubro_Unidad], [Insumo], [Apu_Insumo_Id], [Apu_Insumo_Codigo], [Apu_Insumo_Nombre], [Apu_Categoria_Id], [Apu_Categoria_Codigo], [Apu_Categoria_Nombre], [Costo_Diario], [Rendimiento], [Cantidad]) VALUES (@Id, @Codigo, @Estado, @Descripcion, @Origen, @Apu_Origen_Id, @Apu_Rubro_Id, @Apu_Rubro_Codigo, @Apu_Rubro_Nombre, @Apu_Rubro_Cantidad, @Apu_Rubro_Unidad, @Insumo, @Apu_Insumo_Id, @Apu_Insumo_Codigo, @Apu_Insumo_Nombre, @Apu_Categoria_Id, @Apu_Categoria_Codigo, @Apu_Categoria_Nombre, @Costo_Diario, @Rendimiento, @Cantidad);
	
SELECT Id, Codigo, Estado, Descripcion, Origen, Apu_Origen_Id, Apu_Rubro_Id, Apu_Rubro_Codigo, Apu_Rubro_Nombre, Apu_Rubro_Cantidad, Apu_Rubro_Unidad, Insumo, Apu_Insumo_Id, Apu_Insumo_Codigo, Apu_Insumo_Nombre, Apu_Categoria_Id, Apu_Categoria_Codigo, Apu_Categoria_Nombre, Costo_Diario, Rendimiento, Cantidad FROM Apu_Presupuesto_Rubro_Insumo WHERE (Id = @Id)