CREATE PROCEDURE dbo.Apu_Oferta_Equipo_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Oferta_Id varchar(17),
	@Apu_Equipo_Id varchar(17),
	@Estado char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Apu_Oferta_Id varchar(17),
	@Original_Apu_Equipo_Id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
UPDATE [Apu_Oferta_Equipo] SET [Id] = @Id, [Codigo] = @Codigo, [Apu_Oferta_Id] = @Apu_Oferta_Id, [Apu_Equipo_Id] = @Apu_Equipo_Id, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Apu_Oferta_Id] = @Original_Apu_Oferta_Id) AND ([Apu_Equipo_Id] = @Original_Apu_Equipo_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Apu_Oferta_Id, Apu_Equipo_Id, Estado FROM Apu_Oferta_Equipo WHERE (Id = @Id)