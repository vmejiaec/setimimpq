CREATE PROCEDURE dbo.Int_Sucursal_Insert
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
	@Descripcion varchar(2000)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Int_Sucursal] ([Id], [Codigo], [Nombre], [Abreviatura], [Numero], [Predeterminada], [Int_Empresa_Id], [Int_Moneda_Id], [Estado], [Descripcion]) VALUES (@Id, @Codigo, @Nombre, @Abreviatura, @Numero, @Predeterminada, @Int_Empresa_Id, @Int_Moneda_Id, @Estado, @Descripcion);
	
SELECT Id, Codigo, Nombre, Abreviatura, Numero, Predeterminada, Int_Empresa_Id, Int_Moneda_Id, Estado, Descripcion FROM Int_Sucursal WHERE (Id = @Id)