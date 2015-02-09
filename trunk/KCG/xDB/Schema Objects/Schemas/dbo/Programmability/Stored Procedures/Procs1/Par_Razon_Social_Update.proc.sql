CREATE PROCEDURE dbo.Par_Razon_Social_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Par_Tipo_Identificacion_Id varchar(17),
	@Numero varchar(200),
	@Nombre varchar(500),
	@Nombre_Comercial varchar(500),
	@Int_Empresa_Id varchar(17),
	@Estado char(3),
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
UPDATE [Par_Razon_Social] SET [Id] = @Id, [Codigo] = @Codigo, [Par_Tipo_Identificacion_Id] = @Par_Tipo_Identificacion_Id, [Numero] = @Numero, [Nombre] = @Nombre, [Nombre_Comercial] = @Nombre_Comercial, [Int_Empresa_Id] = @Int_Empresa_Id, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Par_Tipo_Identificacion_Id] = @Original_Par_Tipo_Identificacion_Id) AND ([Numero] = @Original_Numero) AND ([Nombre] = @Original_Nombre) AND ([Nombre_Comercial] = @Original_Nombre_Comercial) AND ([Int_Empresa_Id] = @Original_Int_Empresa_Id) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Par_Tipo_Identificacion_Id, Numero, Nombre, Nombre_Comercial, Int_Empresa_Id, Estado FROM Par_Razon_Social WHERE (Id = @Id)