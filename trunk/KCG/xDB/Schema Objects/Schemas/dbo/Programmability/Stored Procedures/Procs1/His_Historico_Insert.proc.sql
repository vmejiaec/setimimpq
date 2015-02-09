CREATE PROCEDURE [dbo].[His_Historico_Insert]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Dic_Objeto_Id varchar(17),
	@Dic_Objeto_Codigo varchar(200),
	@Dic_Objeto_Nombe varchar(500),
	@Fecha_Creacion datetime,
	@Per_Personal_Id varchar(17),
	@Per_Personal_Codigo varchar(200),
	@Per_Personal_Nombre varchar(500),
	@Int_Usuario_Id varchar(17),
	@Int_Usuario_Codigo varchar(200),
	@Int_Usuario_Nombre varchar(500),
	@Int_Empresa_Id varchar(17),
	@Int_Empresa_Codigo varchar(200),
	@Int_Empresa_Nombre varchar(500),
	@Int_Sucursal_Id varchar(17),
	@Int_Sucursal_Codigo varchar(200),
	@Int_Sucursal_Nombre varchar(500),
	@Descripcion varchar(2000),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [His_Historico] ([Id], [Codigo], [Dic_Objeto_Id], [Dic_Objeto_Codigo], [Dic_Objeto_Nombe], [Fecha_Creacion], [Per_Personal_Id], [Per_Personal_Codigo], [Per_Personal_Nombre], [Int_Usuario_Id], [Int_Usuario_Codigo], [Int_Usuario_Nombre], [Int_Empresa_Id], [Int_Empresa_Codigo], [Int_Empresa_Nombre], [Int_Sucursal_Id], [Int_Sucursal_Codigo], [Int_Sucursal_Nombre], [Descripcion], [Estado]) VALUES (@Id, @Codigo, @Dic_Objeto_Id, @Dic_Objeto_Codigo, @Dic_Objeto_Nombe, @Fecha_Creacion, @Per_Personal_Id, @Per_Personal_Codigo, @Per_Personal_Nombre, @Int_Usuario_Id, @Int_Usuario_Codigo, @Int_Usuario_Nombre, @Int_Empresa_Id, @Int_Empresa_Codigo, @Int_Empresa_Nombre, @Int_Sucursal_Id, @Int_Sucursal_Codigo, @Int_Sucursal_Nombre, @Descripcion, @Estado);
	
SELECT Id, Codigo, Dic_Objeto_Id, Dic_Objeto_Codigo, Dic_Objeto_Nombe, Fecha_Creacion, Per_Personal_Id, Per_Personal_Codigo, Per_Personal_Nombre, Int_Usuario_Id, Int_Usuario_Codigo, Int_Usuario_Nombre, Int_Empresa_Id, Int_Empresa_Codigo, Int_Empresa_Nombre, Int_Sucursal_Id, Int_Sucursal_Codigo, Int_Sucursal_Nombre, Descripcion, Estado FROM His_Historico WHERE (Id = @Id)
