CREATE PROCEDURE dbo.Apu_Oferta_Material_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Oferta_Id varchar(17),
	@Apu_Indice_Id varchar(17),
	@Apu_Material_Id varchar(17),
	@Estado char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Apu_Oferta_Id varchar(17),
	@IsNull_Apu_Indice_Id Int,
	@Original_Apu_Indice_Id varchar(17),
	@Original_Apu_Material_Id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
UPDATE [Apu_Oferta_Material] SET [Id] = @Id, [Codigo] = @Codigo, [Apu_Oferta_Id] = @Apu_Oferta_Id, [Apu_Indice_Id] = @Apu_Indice_Id, [Apu_Material_Id] = @Apu_Material_Id, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Apu_Oferta_Id] = @Original_Apu_Oferta_Id) AND ((@IsNull_Apu_Indice_Id = 1 AND [Apu_Indice_Id] IS NULL) OR ([Apu_Indice_Id] = @Original_Apu_Indice_Id)) AND ([Apu_Material_Id] = @Original_Apu_Material_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Apu_Oferta_Id, Apu_Indice_Id, Apu_Material_Id, Estado FROM Apu_Oferta_Material WHERE (Id = @Id)