CREATE PROCEDURE dbo.Par_Tipo_Identificacion_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Int_Empresa_Id varchar(17),
	@Descripcion varchar(2000),
	@Estado char(3),
	@Cedula varchar(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Par_Tipo_Identificacion] ([Id], [Codigo], [Nombre], [Int_Empresa_Id], [Descripcion], [Estado], [Cedula]) VALUES (@Id, @Codigo, @Nombre, @Int_Empresa_Id, @Descripcion, @Estado, @Cedula);
	
SELECT Id, Codigo, Nombre, Int_Empresa_Id, Descripcion, Estado, Cedula FROM Par_Tipo_Identificacion WHERE (Id = @Id)