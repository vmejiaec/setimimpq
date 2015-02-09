CREATE PROCEDURE dbo.Apu_Indice_Equipo_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Indice_Id varchar(17),
	@Porcentaje numeric(5, 2),
	@Int_Empresa_Id varchar(17),
	@Estado char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Apu_Indice_Id varchar(17),
	@Original_Porcentaje numeric(5, 2),
	@Original_Int_Empresa_Id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
UPDATE [Apu_Indice_Equipo] SET [Id] = @Id, [Codigo] = @Codigo, [Apu_Indice_Id] = @Apu_Indice_Id, [Porcentaje] = @Porcentaje, [Int_Empresa_Id] = @Int_Empresa_Id, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Apu_Indice_Id] = @Original_Apu_Indice_Id) AND ([Porcentaje] = @Original_Porcentaje) AND ([Int_Empresa_Id] = @Original_Int_Empresa_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Apu_Indice_Id, Porcentaje, Int_Empresa_Id, Estado FROM Apu_Indice_Equipo WHERE (Id = @Id)