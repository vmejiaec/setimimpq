CREATE PROCEDURE dbo.Fis_Multa_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Estado char(3),
	@Descripcion varchar(2000),
	@Int_Empresa_Id varchar(17)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Fis_Multa] ([Id], [Codigo], [Nombre], [Estado], [Descripcion], [Int_Empresa_Id]) VALUES (@Id, @Codigo, @Nombre, @Estado, @Descripcion, @Int_Empresa_Id);
	
SELECT Id, Codigo, Nombre, Estado, Descripcion, Int_Empresa_Id FROM Fis_Multa WHERE (Id = @Id)