CREATE PROCEDURE dbo.Par_Razon_Social_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Par_Tipo_Identificacion_Id varchar(17),
	@Numero varchar(200),
	@Nombre varchar(500),
	@Nombre_Comercial varchar(500),
	@Int_Empresa_Id varchar(17),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Par_Razon_Social] ([Id], [Codigo], [Par_Tipo_Identificacion_Id], [Numero], [Nombre], [Nombre_Comercial], [Int_Empresa_Id], [Estado]) VALUES (@Id, @Codigo, @Par_Tipo_Identificacion_Id, @Numero, @Nombre, @Nombre_Comercial, @Int_Empresa_Id, @Estado);
	
SELECT Id, Codigo, Par_Tipo_Identificacion_Id, Numero, Nombre, Nombre_Comercial, Int_Empresa_Id, Estado FROM Par_Razon_Social WHERE (Id = @Id)