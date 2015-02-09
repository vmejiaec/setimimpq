CREATE PROCEDURE [dbo].Pla_Partida_Upd
(
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Estado char(3),
	@Original_Id int,
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_Estado char(3),
	@Id int
)
AS
	SET NOCOUNT OFF;
UPDATE [Pla_Partida] SET [Codigo] = @Codigo, [Nombre] = @Nombre, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Estado] = @Original_Estado));
	
SELECT Id, Codigo, Nombre, Estado FROM Pla_Partida WHERE (Id = @Id)