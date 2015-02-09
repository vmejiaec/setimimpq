CREATE PROCEDURE dbo.Par_Iva_Insert
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
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Par_Iva] ([Id], [Codigo], [Nombre], [Valor], [Cuenta], [Tipo_Auxiliar], [Auxiliar], [Int_Empresa_Id], [Creacion_Per_Personal_Id], [Fecha_Creacion], [Update_Per_Personal_Id], [Fecha_Update], [Descripcion], [Estado]) VALUES (@Id, @Codigo, @Nombre, @Valor, @Cuenta, @Tipo_Auxiliar, @Auxiliar, @Int_Empresa_Id, @Creacion_Per_Personal_Id, @Fecha_Creacion, @Update_Per_Personal_Id, @Fecha_Update, @Descripcion, @Estado);
	
SELECT Id, Codigo, Nombre, Valor, Cuenta, Tipo_Auxiliar, Auxiliar, Int_Empresa_Id, Creacion_Per_Personal_Id, Fecha_Creacion, Update_Per_Personal_Id, Fecha_Update, Descripcion, Estado FROM Par_Iva WHERE (Id = @Id)