CREATE PROCEDURE dbo.Apu_Categoria_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Int_Empresa_Id varchar(17),
	@Costo_Diario numeric(17, 4),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apu_Categoria] ([Id], [Codigo], [Nombre], [Int_Empresa_Id], [Costo_Diario], [Estado]) VALUES (@Id, @Codigo, @Nombre, @Int_Empresa_Id, @Costo_Diario, @Estado);
	
SELECT Id, Codigo, Nombre, Int_Empresa_Id, Costo_Diario, Estado FROM Apu_Categoria WHERE (Id = @Id)