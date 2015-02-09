CREATE PROCEDURE dbo.Apu_Presupuesto_Indice_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Estado char(3),
	@Descripcion varchar(2000),
	@Apu_Origen_Id varchar(17),
	@Apu_Insumo_Id varchar(17),
	@Apu_Indice_Id varchar(17),
	@Apu_Indice_Codigo varchar(200),
	@Apu_Indice_Nombre varchar(500),
	@Porcentaje numeric(5, 2),
	@Costo_Total numeric(17, 4),
	@Costo_Indice numeric(17, 4)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apu_Presupuesto_Indice] ([Id], [Codigo], [Estado], [Descripcion], [Apu_Origen_Id], [Apu_Insumo_Id], [Apu_Indice_Id], [Apu_Indice_Codigo], [Apu_Indice_Nombre], [Porcentaje], [Costo_Total], [Costo_Indice]) VALUES (@Id, @Codigo, @Estado, @Descripcion, @Apu_Origen_Id, @Apu_Insumo_Id, @Apu_Indice_Id, @Apu_Indice_Codigo, @Apu_Indice_Nombre, @Porcentaje, @Costo_Total, @Costo_Indice);
	
SELECT Id, Codigo, Estado, Descripcion, Apu_Origen_Id, Apu_Insumo_Id, Apu_Indice_Id, Apu_Indice_Codigo, Apu_Indice_Nombre, Porcentaje, Costo_Total, Costo_Indice FROM Apu_Presupuesto_Indice WHERE (Id = @Id)