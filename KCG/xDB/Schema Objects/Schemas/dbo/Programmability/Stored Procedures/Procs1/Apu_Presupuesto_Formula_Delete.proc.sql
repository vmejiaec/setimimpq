CREATE PROCEDURE dbo.Apu_Presupuesto_Formula_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@Original_Apu_Presupuesto_Id varchar(17),
	@Original_Apu_Indice_Id varchar(17),
	@Original_Apu_Indice_Codigo varchar(200),
	@Original_Apu_Indice_Nombre varchar(500),
	@Original_Costo_Total numeric(17, 4),
	@Original_Coeficiente numeric(17, 4),
	@IsNull_Letra Int,
	@Original_Letra varchar(1),
	@Original_Costo_Actual numeric(17, 4)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Apu_Presupuesto_Formula] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ([Apu_Presupuesto_Id] = @Original_Apu_Presupuesto_Id) AND ([Apu_Indice_Id] = @Original_Apu_Indice_Id) AND ([Apu_Indice_Codigo] = @Original_Apu_Indice_Codigo) AND ([Apu_Indice_Nombre] = @Original_Apu_Indice_Nombre) AND ([Costo_Total] = @Original_Costo_Total) AND ([Coeficiente] = @Original_Coeficiente) AND ((@IsNull_Letra = 1 AND [Letra] IS NULL) OR ([Letra] = @Original_Letra)) AND ([Costo_Actual] = @Original_Costo_Actual))