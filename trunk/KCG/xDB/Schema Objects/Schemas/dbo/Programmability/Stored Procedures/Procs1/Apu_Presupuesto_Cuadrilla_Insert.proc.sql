CREATE PROCEDURE dbo.Apu_Presupuesto_Cuadrilla_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Estado char(3),
	@Apu_Presupuesto_Id varchar(17),
	@Origen varchar(3),
	@Origen_Id varchar(17),
	@Origen_Codigo varchar(200),
	@Origen_Nombre varchar(500),
	@Costo_Total numeric(17, 4),
	@Salario_Real numeric(17, 4),
	@Numero_Trabajadores numeric(17, 4),
	@Coeficiente numeric(17, 4),
	@Costo_Actual numeric(17, 4)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apu_Presupuesto_Cuadrilla] ([Id], [Codigo], [Estado], [Apu_Presupuesto_Id], [Origen], [Origen_Id], [Origen_Codigo], [Origen_Nombre], [Costo_Total], [Salario_Real], [Numero_Trabajadores], [Coeficiente], [Costo_Actual]) VALUES (@Id, @Codigo, @Estado, @Apu_Presupuesto_Id, @Origen, @Origen_Id, @Origen_Codigo, @Origen_Nombre, @Costo_Total, @Salario_Real, @Numero_Trabajadores, @Coeficiente, @Costo_Actual);
	
SELECT Id, Codigo, Estado, Apu_Presupuesto_Id, Origen, Origen_Id, Origen_Codigo, Origen_Nombre, Costo_Total, Salario_Real, Numero_Trabajadores, Coeficiente, Costo_Actual FROM Apu_Presupuesto_Cuadrilla WHERE (Id = @Id)