CREATE PROCEDURE [dbo].Pla_Partida_Del
(
	@Original_Id int,
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Pla_Partida] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Estado] = @Original_Estado))