CREATE PROCEDURE dbo.Par_Iva_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Valor numeric(5, 2),
	@Cuenta varchar(200),
	@Tipo_Auxiliar varchar(3),
	@Auxiliar varchar(200),
	@Int_Empresa_Id varchar(17),
	@Creacion_Per_Personal_Id varchar(17),
	@Fecha_Creacion smalldatetime,
	@Update_Per_Personal_Id varchar(17),
	@Fecha_Update smalldatetime,
	@Descripcion varchar(2000),
	@Estado char(3),
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
UPDATE [Par_Iva] SET [Id] = @Id, [Codigo] = @Codigo, [Nombre] = @Nombre, [Valor] = @Valor, [Cuenta] = @Cuenta, [Tipo_Auxiliar] = @Tipo_Auxiliar, [Auxiliar] = @Auxiliar, [Int_Empresa_Id] = @Int_Empresa_Id, [Creacion_Per_Personal_Id] = @Creacion_Per_Personal_Id, [Fecha_Creacion] = @Fecha_Creacion, [Update_Per_Personal_Id] = @Update_Per_Personal_Id, [Fecha_Update] = @Fecha_Update, [Descripcion] = @Descripcion, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Nombre] = @Original_Nombre) AND ([Valor] = @Original_Valor) AND ((@IsNull_Cuenta = 1 AND [Cuenta] IS NULL) OR ([Cuenta] = @Original_Cuenta)) AND ((@IsNull_Tipo_Auxiliar = 1 AND [Tipo_Auxiliar] IS NULL) OR ([Tipo_Auxiliar] = @Original_Tipo_Auxiliar)) AND ((@IsNull_Auxiliar = 1 AND [Auxiliar] IS NULL) OR ([Auxiliar] = @Original_Auxiliar)) AND ([Int_Empresa_Id] = @Original_Int_Empresa_Id) AND ([Creacion_Per_Personal_Id] = @Original_Creacion_Per_Personal_Id) AND ([Fecha_Creacion] = @Original_Fecha_Creacion) AND ([Update_Per_Personal_Id] = @Original_Update_Per_Personal_Id) AND ([Fecha_Update] = @Original_Fecha_Update) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Nombre, Valor, Cuenta, Tipo_Auxiliar, Auxiliar, Int_Empresa_Id, Creacion_Per_Personal_Id, Fecha_Creacion, Update_Per_Personal_Id, Fecha_Update, Descripcion, Estado FROM Par_Iva WHERE (Id = @Id)