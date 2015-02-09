CREATE PROCEDURE dbo.Par_Retencion_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Int_Empresa_Id varchar(17),
	@Valor varchar(50),
	@Descripcion varchar(2000),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Par_Retencion] ([Id], [Codigo], [Nombre], [Int_Empresa_Id], [Valor], [Descripcion], [Estado]) VALUES (@Id, @Codigo, @Nombre, @Int_Empresa_Id, @Valor, @Descripcion, @Estado);
	
SELECT Id, Codigo, Nombre, Int_Empresa_Id, Valor, Descripcion, Estado FROM Par_Retencion WHERE (Id = @Id)