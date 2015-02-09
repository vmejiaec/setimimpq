CREATE PROCEDURE [dbo].[Apu_Categoria_Update]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Int_Empresa_Id varchar(17),
	@Costo_Diario numeric(17, 4),
	@Estado char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_Int_Empresa_Id varchar(17),
	@Original_Costo_Diario numeric(17, 4),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
UPDATE [Apu_Categoria] SET [Id] = @Id, [Codigo] = @Codigo, [Nombre] = @Nombre, [Int_Empresa_Id] = @Int_Empresa_Id, [Costo_Diario] = @Costo_Diario, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Int_Empresa_Id] = @Original_Int_Empresa_Id) AND ([Costo_Diario] = @Original_Costo_Diario) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));

UPDATE APU_MANO_OBRA
SET COSTO_DIARIO =	@Costo_Diario
WHERE APU_CATEGORIA_ID = @Id
 
SELECT Id, Codigo, Nombre, Int_Empresa_Id, Costo_Diario, Estado FROM Apu_Categoria WHERE (Id = @Id)
