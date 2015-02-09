CREATE PROCEDURE dbo.Par_Retencion_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Int_Empresa_Id varchar(17),
	@Valor varchar(50),
	@Descripcion varchar(2000),
	@Estado char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_Int_Empresa_Id varchar(17),
	@Original_Valor varchar(50),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(2000),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
UPDATE [Par_Retencion] SET [Id] = @Id, [Codigo] = @Codigo, [Nombre] = @Nombre, [Int_Empresa_Id] = @Int_Empresa_Id, [Valor] = @Valor, [Descripcion] = @Descripcion, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Int_Empresa_Id] = @Original_Int_Empresa_Id) AND ([Valor] = @Original_Valor) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Nombre, Int_Empresa_Id, Valor, Descripcion, Estado FROM Par_Retencion WHERE (Id = @Id)