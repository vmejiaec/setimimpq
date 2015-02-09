CREATE PROCEDURE dbo.Apu_Titulo_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Int_Empresa_Id varchar(17),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apu_Titulo] ([Id], [Codigo], [Nombre], [Int_Empresa_Id], [Estado]) VALUES (@Id, @Codigo, @Nombre, @Int_Empresa_Id, @Estado);
	
SELECT Id, Codigo, Nombre, Int_Empresa_Id, Estado FROM Apu_Titulo WHERE (Id = @Id)