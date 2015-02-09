CREATE PROCEDURE dbo.Apu_Presupuesto_Formula_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Estado char(3),
	@Apu_Presupuesto_Id varchar(17),
	@Apu_Indice_Id varchar(17),
	@Apu_Indice_Codigo varchar(200),
	@Apu_Indice_Nombre varchar(500),
	@Costo_Total numeric(17, 4),
	@Coeficiente numeric(17, 4),
	@Letra varchar(1),
	@Costo_Actual numeric(17, 4)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apu_Presupuesto_Formula] ([Id], [Codigo], [Estado], [Apu_Presupuesto_Id], [Apu_Indice_Id], [Apu_Indice_Codigo], [Apu_Indice_Nombre], [Costo_Total], [Coeficiente], [Letra], [Costo_Actual]) VALUES (@Id, @Codigo, @Estado, @Apu_Presupuesto_Id, @Apu_Indice_Id, @Apu_Indice_Codigo, @Apu_Indice_Nombre, @Costo_Total, @Coeficiente, @Letra, @Costo_Actual);
	
SELECT Id, Codigo, Estado, Apu_Presupuesto_Id, Apu_Indice_Id, Apu_Indice_Codigo, Apu_Indice_Nombre, Costo_Total, Coeficiente, Letra, Costo_Actual FROM Apu_Presupuesto_Formula WHERE (Id = @Id)