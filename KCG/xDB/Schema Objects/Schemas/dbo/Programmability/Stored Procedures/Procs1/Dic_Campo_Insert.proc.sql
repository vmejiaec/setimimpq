CREATE PROCEDURE dbo.Dic_Campo_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Dic_Objeto_Id varchar(17),
	@Tipo_Dato char(3),
	@Tipo_Constraint char(3),
	@Filtro varchar(3),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Dic_Campo] ([Id], [Codigo], [Nombre], [Dic_Objeto_Id], [Tipo_Dato], [Tipo_Constraint], [Filtro], [Estado]) VALUES (@Id, @Codigo, @Nombre, @Dic_Objeto_Id, @Tipo_Dato, @Tipo_Constraint, @Filtro, @Estado);
	
SELECT Id, Codigo, Nombre, Dic_Objeto_Id, Tipo_Dato, Tipo_Constraint, Filtro, Estado FROM Dic_Campo WHERE (Id = @Id)