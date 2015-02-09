CREATE PROCEDURE dbo.Par_Razon_Social_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Par_Tipo_Identificacion_Id varchar(17),
	@Original_Numero varchar(200),
	@Original_Nombre varchar(500),
	@Original_Nombre_Comercial varchar(500),
	@Original_Int_Empresa_Id varchar(17),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Par_Razon_Social] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Par_Tipo_Identificacion_Id] = @Original_Par_Tipo_Identificacion_Id) AND ([Numero] = @Original_Numero) AND ([Nombre] = @Original_Nombre) AND ([Nombre_Comercial] = @Original_Nombre_Comercial) AND ([Int_Empresa_Id] = @Original_Int_Empresa_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))