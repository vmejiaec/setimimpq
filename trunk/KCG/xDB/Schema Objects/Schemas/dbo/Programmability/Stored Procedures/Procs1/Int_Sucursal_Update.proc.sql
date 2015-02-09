CREATE PROCEDURE dbo.Int_Sucursal_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Abreviatura varchar(50),
	@Numero int,
	@Predeterminada varchar(3),
	@Int_Empresa_Id varchar(17),
	@Int_Moneda_Id varchar(17),
	@Estado char(3),
	@Descripcion varchar(2000),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@IsNull_Abreviatura Int,
	@Original_Abreviatura varchar(50),
	@Original_Numero int,
	@Original_Predeterminada varchar(3),
	@Original_Int_Empresa_Id varchar(17),
	@Original_Int_Moneda_Id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(2000)
)
AS
	SET NOCOUNT OFF;
UPDATE [Int_Sucursal] SET [Id] = @Id, [Codigo] = @Codigo, [Nombre] = @Nombre, [Abreviatura] = @Abreviatura, [Numero] = @Numero, [Predeterminada] = @Predeterminada, [Int_Empresa_Id] = @Int_Empresa_Id, [Int_Moneda_Id] = @Int_Moneda_Id, [Estado] = @Estado, [Descripcion] = @Descripcion WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ((@IsNull_Abreviatura = 1 AND [Abreviatura] IS NULL) OR ([Abreviatura] = @Original_Abreviatura)) AND ([Numero] = @Original_Numero) AND ([Predeterminada] = @Original_Predeterminada) AND ([Int_Empresa_Id] = @Original_Int_Empresa_Id) AND ([Int_Moneda_Id] = @Original_Int_Moneda_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)));
	
SELECT Id, Codigo, Nombre, Abreviatura, Numero, Predeterminada, Int_Empresa_Id, Int_Moneda_Id, Estado, Descripcion FROM Int_Sucursal WHERE (Id = @Id)