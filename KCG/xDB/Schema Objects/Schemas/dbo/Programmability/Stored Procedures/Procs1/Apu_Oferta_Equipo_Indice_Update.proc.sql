CREATE PROCEDURE dbo.Apu_Oferta_Equipo_Indice_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Oferta_Equipo_Id varchar(17),
	@Apu_Indice_Id varchar(17),
	@Porcentaje numeric(5, 2),
	@Estado char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Apu_Oferta_Equipo_Id varchar(17),
	@Original_Apu_Indice_Id varchar(17),
	@Original_Porcentaje numeric(5, 2),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
UPDATE [Apu_Oferta_Equipo_Indice] SET [Id] = @Id, [Codigo] = @Codigo, [Apu_Oferta_Equipo_Id] = @Apu_Oferta_Equipo_Id, [Apu_Indice_Id] = @Apu_Indice_Id, [Porcentaje] = @Porcentaje, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Apu_Oferta_Equipo_Id] = @Original_Apu_Oferta_Equipo_Id) AND ([Apu_Indice_Id] = @Original_Apu_Indice_Id) AND ([Porcentaje] = @Original_Porcentaje) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Apu_Oferta_Equipo_Id, Apu_Indice_Id, Porcentaje, Estado FROM Apu_Oferta_Equipo_Indice WHERE (Id = @Id)