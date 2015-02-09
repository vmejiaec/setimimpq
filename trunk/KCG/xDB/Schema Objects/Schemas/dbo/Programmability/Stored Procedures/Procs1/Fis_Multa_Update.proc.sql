CREATE PROCEDURE dbo.Fis_Multa_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Estado char(3),
	@Descripcion varchar(2000),
	@Int_Empresa_Id varchar(17),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(2000),
	@Original_Int_Empresa_Id varchar(17)
)
AS
	SET NOCOUNT OFF;
UPDATE [Fis_Multa] SET [Id] = @Id, [Codigo] = @Codigo, [Nombre] = @Nombre, [Estado] = @Estado, [Descripcion] = @Descripcion, [Int_Empresa_Id] = @Int_Empresa_Id WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)) AND ([Int_Empresa_Id] = @Original_Int_Empresa_Id));
	
SELECT Id, Codigo, Nombre, Estado, Descripcion, Int_Empresa_Id FROM Fis_Multa WHERE (Id = @Id)