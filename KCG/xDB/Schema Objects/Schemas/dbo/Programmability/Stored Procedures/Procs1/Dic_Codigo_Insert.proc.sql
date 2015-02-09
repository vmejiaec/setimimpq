CREATE PROCEDURE dbo.Dic_Codigo_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Tipo char(3),
	@Orden int,
	@Dic_Campo_Id varchar(17),
	@Act_Dic_Campo_id varchar(17),
	@Ref_Dic_Campo_Id varchar(17),
	@Dic_Secuencia_Id varchar(17),
	@Pre_Dic_Campo_Id varchar(17),
	@Constante varchar(200),
	@Funcion varchar(8000),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Dic_Codigo] ([Id], [Codigo], [Tipo], [Orden], [Dic_Campo_Id], [Act_Dic_Campo_id], [Ref_Dic_Campo_Id], [Dic_Secuencia_Id], [Pre_Dic_Campo_Id], [Constante], [Funcion], [Estado]) VALUES (@Id, @Codigo, @Tipo, @Orden, @Dic_Campo_Id, @Act_Dic_Campo_id, @Ref_Dic_Campo_Id, @Dic_Secuencia_Id, @Pre_Dic_Campo_Id, @Constante, @Funcion, @Estado);
	
SELECT Id, Codigo, Tipo, Orden, Dic_Campo_Id, Act_Dic_Campo_id, Ref_Dic_Campo_Id, Dic_Secuencia_Id, Pre_Dic_Campo_Id, Constante, Funcion, Estado FROM Dic_Codigo WHERE (Id = @Id)