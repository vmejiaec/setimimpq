CREATE PROCEDURE [dbo].Pla_Mov_Upd
(
	@Codigo varchar(200),
	@Pla_Poa_Id int,
	@Pla_Doc_Id int,
	@Orden int,
	@Valor numeric(17, 4),
	@Estado char(3),
	@Tipo char(3),
	@Original_Id int,
	@Original_Codigo varchar(200),
	@Original_Pla_Poa_Id int,
	@Original_Pla_Doc_Id int,
	@Original_Orden int,
	@Original_Valor numeric(17, 4),
	@Original_Estado char(3),
	@Original_Tipo char(3),
	@Id int
)
AS
	SET NOCOUNT OFF;
UPDATE [Pla_Mov] SET [Codigo] = @Codigo, [Pla_Poa_Id] = @Pla_Poa_Id, [Pla_Doc_Id] = @Pla_Doc_Id, [Orden] = @Orden, [Valor] = @Valor, [Estado] = @Estado, [Tipo] = @Tipo WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Pla_Poa_Id] = @Original_Pla_Poa_Id) AND ([Pla_Doc_Id] = @Original_Pla_Doc_Id) AND ([Orden] = @Original_Orden) AND ([Valor] = @Original_Valor) AND ([Estado] = @Original_Estado) AND ([Tipo] = @Original_Tipo));
	
SELECT Id, Codigo, Pla_Poa_Id, Pla_Doc_Id, Orden, Valor, Estado, Tipo FROM Pla_Mov WHERE (Id = @Id)