CREATE PROCEDURE dbo.Int_Moneda_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@IsNull_Abreviatura Int,
	@Original_Abreviatura varchar(50),
	@Original_Moneda_Id_Ref varchar(200),
	@Original_Simbolo varchar(5),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(2000),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Int_Moneda] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ((@IsNull_Abreviatura = 1 AND [Abreviatura] IS NULL) OR ([Abreviatura] = @Original_Abreviatura)) AND ([Moneda_Id_Ref] = @Original_Moneda_Id_Ref) AND ([Simbolo] = @Original_Simbolo) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))