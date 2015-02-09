CREATE PROCEDURE [dbo].Pla_Poa_Upd
(
	@Codigo varchar(200),
	@Pla_Tarea_Id int,
	@Pla_Partida_Id int,
	@Estado char(3),
	@Original_Id int,
	@Original_Codigo varchar(200),
	@Original_Pla_Tarea_Id int,
	@Original_Pla_Partida_Id int,
	@Original_Estado char(3),
	@Id int
)
AS
	SET NOCOUNT OFF;
UPDATE [Pla_Poa] SET [Codigo] = @Codigo, [Pla_Tarea_Id] = @Pla_Tarea_Id, [Pla_Partida_Id] = @Pla_Partida_Id, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Pla_Tarea_Id] = @Original_Pla_Tarea_Id) AND ([Pla_Partida_Id] = @Original_Pla_Partida_Id) AND ([Estado] = @Original_Estado));
	
SELECT Id, Codigo, Pla_Tarea_Id, Pla_Partida_Id, Estado FROM Pla_Poa WHERE (Id = @Id)