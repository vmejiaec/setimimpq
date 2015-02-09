CREATE PROCEDURE [dbo].Pla_Poa_Del
(
	@Original_Id int,
	@Original_Codigo varchar(200),
	@Original_Pla_Tarea_Id int,
	@Original_Pla_Partida_Id int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Pla_Poa] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Pla_Tarea_Id] = @Original_Pla_Tarea_Id) AND ([Pla_Partida_Id] = @Original_Pla_Partida_Id) AND ([Estado] = @Original_Estado))