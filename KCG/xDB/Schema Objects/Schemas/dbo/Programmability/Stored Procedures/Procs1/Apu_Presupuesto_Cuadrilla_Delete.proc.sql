CREATE PROCEDURE dbo.Apu_Presupuesto_Cuadrilla_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@Original_Apu_Presupuesto_Id varchar(17),
	@Original_Origen varchar(3),
	@Original_Origen_Id varchar(17),
	@Original_Origen_Codigo varchar(200),
	@Original_Origen_Nombre varchar(500),
	@Original_Costo_Total numeric(17, 4),
	@Original_Salario_Real numeric(17, 4),
	@Original_Numero_Trabajadores numeric(17, 4),
	@Original_Coeficiente numeric(17, 4),
	@Original_Costo_Actual numeric(17, 4)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Apu_Presupuesto_Cuadrilla] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ([Apu_Presupuesto_Id] = @Original_Apu_Presupuesto_Id) AND ([Origen] = @Original_Origen) AND ([Origen_Id] = @Original_Origen_Id) AND ([Origen_Codigo] = @Original_Origen_Codigo) AND ([Origen_Nombre] = @Original_Origen_Nombre) AND ([Costo_Total] = @Original_Costo_Total) AND ([Salario_Real] = @Original_Salario_Real) AND ([Numero_Trabajadores] = @Original_Numero_Trabajadores) AND ([Coeficiente] = @Original_Coeficiente) AND ([Costo_Actual] = @Original_Costo_Actual))