CREATE PROCEDURE dbo.Apu_Provincia_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Int_Empresa_Id varchar(17),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apu_Provincia] ([Id], [Codigo], [Nombre], [Int_Empresa_Id], [Estado]) VALUES (@Id, @Codigo, @Nombre, @Int_Empresa_Id, @Estado);
	
SELECT Id, Codigo, Nombre, Int_Empresa_Id, Estado FROM Apu_Provincia WHERE (Id = @Id)