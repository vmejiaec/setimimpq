CREATE PROCEDURE dbo.Par_Iva_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Nombre varchar(500),
	@Original_Valor numeric(5, 2),
	@IsNull_Cuenta Int,
	@Original_Cuenta varchar(200),
	@IsNull_Tipo_Auxiliar Int,
	@Original_Tipo_Auxiliar varchar(3),
	@IsNull_Auxiliar Int,
	@Original_Auxiliar varchar(200),
	@Original_Int_Empresa_Id varchar(17),
	@Original_Creacion_Per_Personal_Id varchar(17),
	@Original_Fecha_Creacion smalldatetime,
	@Original_Update_Per_Personal_Id varchar(17),
	@Original_Fecha_Update smalldatetime,
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(2000),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Par_Iva] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Valor] = @Original_Valor) AND ((@IsNull_Cuenta = 1 AND [Cuenta] IS NULL) OR ([Cuenta] = @Original_Cuenta)) AND ((@IsNull_Tipo_Auxiliar = 1 AND [Tipo_Auxiliar] IS NULL) OR ([Tipo_Auxiliar] = @Original_Tipo_Auxiliar)) AND ((@IsNull_Auxiliar = 1 AND [Auxiliar] IS NULL) OR ([Auxiliar] = @Original_Auxiliar)) AND ([Int_Empresa_Id] = @Original_Int_Empresa_Id) AND ([Creacion_Per_Personal_Id] = @Original_Creacion_Per_Personal_Id) AND ([Fecha_Creacion] = @Original_Fecha_Creacion) AND ([Update_Per_Personal_Id] = @Original_Update_Per_Personal_Id) AND ([Fecha_Update] = @Original_Fecha_Update) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))