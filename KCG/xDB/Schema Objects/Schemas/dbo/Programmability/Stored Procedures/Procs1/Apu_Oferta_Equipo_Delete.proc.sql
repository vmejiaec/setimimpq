CREATE PROCEDURE dbo.Apu_Oferta_Equipo_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Apu_Oferta_Id varchar(17),
	@Original_Apu_Equipo_Id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Apu_Oferta_Equipo] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Apu_Oferta_Id] = @Original_Apu_Oferta_Id) AND ([Apu_Equipo_Id] = @Original_Apu_Equipo_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))