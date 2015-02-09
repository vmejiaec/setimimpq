CREATE PROCEDURE dbo.Dic_Secuencia_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Valor_Actual int,
	@Valor_Minimo int,
	@Valor_Maximo int,
	@Incremento int,
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Dic_Secuencia] ([Id], [Codigo], [Nombre], [Valor_Actual], [Valor_Minimo], [Valor_Maximo], [Incremento], [Estado]) VALUES (@Id, @Codigo, @Nombre, @Valor_Actual, @Valor_Minimo, @Valor_Maximo, @Incremento, @Estado);
	
SELECT Id, Codigo, Nombre, Valor_Actual, Valor_Minimo, Valor_Maximo, Incremento, Estado FROM Dic_Secuencia WHERE (Id = @Id)