CREATE PROCEDURE dbo.Int_Empresa_Update
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Abreviatura varchar(50),
	@Nombre varchar(500),
	@Imagen varchar(2000),
	@Descripcion varchar(2000),
	@Estado char(3),
	@Plan_Cuenta varchar(3),
	@Direccion varchar(2000),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@IsNull_Abreviatura Int,
	@Original_Abreviatura varchar(50),
	@Original_Nombre varchar(500),
	@IsNull_Imagen Int,
	@Original_Imagen varchar(2000),
	@IsNull_Descripcion Int,
	@Original_Descripcion varchar(2000),
	@IsNull_Estado Int,
	@Original_Estado char(3),
	@IsNull_Plan_Cuenta Int,
	@Original_Plan_Cuenta varchar(3),
	@IsNull_Direccion Int,
	@Original_Direccion varchar(2000)
)
AS
	SET NOCOUNT OFF;
UPDATE [Int_Empresa] SET [Id] = @Id, [Codigo] = @Codigo, [Abreviatura] = @Abreviatura, [Nombre] = @Nombre, [Imagen] = @Imagen, [Descripcion] = @Descripcion, [Estado] = @Estado, [Plan_Cuenta] = @Plan_Cuenta, [Direccion] = @Direccion WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ((@IsNull_Abreviatura = 1 AND [Abreviatura] IS NULL) OR ([Abreviatura] = @Original_Abreviatura)) AND ([Nombre] = @Original_Nombre) AND ((@IsNull_Imagen = 1 AND [Imagen] IS NULL) OR ([Imagen] = @Original_Imagen)) AND ((@IsNull_Descripcion = 1 AND [Descripcion] IS NULL) OR ([Descripcion] = @Original_Descripcion)) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)) AND ((@IsNull_Plan_Cuenta = 1 AND [Plan_Cuenta] IS NULL) OR ([Plan_Cuenta] = @Original_Plan_Cuenta)) AND ((@IsNull_Direccion = 1 AND [Direccion] IS NULL) OR ([Direccion] = @Original_Direccion)));
	
SELECT Id, Codigo, Abreviatura, Nombre, Imagen, Descripcion, Estado, Plan_Cuenta, Direccion FROM Int_Empresa WHERE (Id = @Id)