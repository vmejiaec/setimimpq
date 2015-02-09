CREATE PROCEDURE [dbo].Pla_Mov_Del
(
	@Original_Id int,
	@Original_Codigo varchar(200),
	@Original_Pla_Poa_Id int,
	@Original_Pla_Doc_Id int,
	@Original_Orden int,
	@Original_Valor numeric(17, 4),
	@Original_Estado char(3),
	@Original_Tipo char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Pla_Mov] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Pla_Poa_Id] = @Original_Pla_Poa_Id) AND ([Pla_Doc_Id] = @Original_Pla_Doc_Id) AND ([Orden] = @Original_Orden) AND ([Valor] = @Original_Valor) AND ([Estado] = @Original_Estado) AND ([Tipo] = @Original_Tipo))