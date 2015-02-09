CREATE PROCEDURE [dbo].Pla_Poa_Ins
(
	@Codigo varchar(200),
	@Pla_Tarea_Id int,
	@Pla_Partida_Id int,
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Pla_Poa] ([Codigo], [Pla_Tarea_Id], [Pla_Partida_Id], [Estado]) VALUES (@Codigo, @Pla_Tarea_Id, @Pla_Partida_Id, @Estado);
	
SELECT Id, Codigo, Pla_Tarea_Id, Pla_Partida_Id, Estado FROM Pla_Poa WHERE (Id = SCOPE_IDENTITY())