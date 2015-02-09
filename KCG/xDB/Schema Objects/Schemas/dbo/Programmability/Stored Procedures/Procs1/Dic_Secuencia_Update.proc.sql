CREATE PROCEDURE dbo.Dic_Secuencia_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Valor_Actual int,
	@Valor_Minimo int,
	@Valor_Maximo int,
	@Incremento int,
	@Estado char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_Valor_Actual int,
	@Original_Valor_Minimo int,
	@Original_Valor_Maximo int,
	@Original_Incremento int,
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
UPDATE [Dic_Secuencia] SET [Id] = @Id, [Codigo] = @Codigo, [Nombre] = @Nombre, [Valor_Actual] = @Valor_Actual, [Valor_Minimo] = @Valor_Minimo, [Valor_Maximo] = @Valor_Maximo, [Incremento] = @Incremento, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Valor_Actual] = @Original_Valor_Actual) AND ([Valor_Minimo] = @Original_Valor_Minimo) AND ([Valor_Maximo] = @Original_Valor_Maximo) AND ([Incremento] = @Original_Incremento) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Nombre, Valor_Actual, Valor_Minimo, Valor_Maximo, Incremento, Estado FROM Dic_Secuencia WHERE (Id = @Id)