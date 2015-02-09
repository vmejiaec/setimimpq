CREATE PROCEDURE dbo.Int_Sucursal_Delete
(
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
DELETE FROM [Int_Sucursal] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ((@IsNull_Abreviatura = 1 AND [Abreviatura] IS NULL) OR ([Abreviatura] = @Original_Abreviatura)) AND ([Numero] = @Original_Numero) AND ([Predeterminada] = @Original_Predeterminada) AND ([Int_Empresa_Id] = @Original_Int_Empresa_Id) AND ([Int_Moneda_Id] = @Original_Int_Moneda_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)))