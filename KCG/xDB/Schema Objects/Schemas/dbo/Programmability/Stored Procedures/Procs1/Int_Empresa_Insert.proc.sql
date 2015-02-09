CREATE PROCEDURE dbo.Int_Empresa_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Abreviatura varchar(50),
	@Nombre varchar(500),
	@Imagen varchar(2000),
	@Descripcion varchar(2000),
	@Estado char(3),
	@Plan_Cuenta varchar(3),
	@Direccion varchar(2000)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Int_Empresa] ([Id], [Codigo], [Abreviatura], [Nombre], [Imagen], [Descripcion], [Estado], [Plan_Cuenta], [Direccion]) VALUES (@Id, @Codigo, @Abreviatura, @Nombre, @Imagen, @Descripcion, @Estado, @Plan_Cuenta, @Direccion);
	
SELECT Id, Codigo, Abreviatura, Nombre, Imagen, Descripcion, Estado, Plan_Cuenta, Direccion FROM Int_Empresa WHERE (Id = @Id)