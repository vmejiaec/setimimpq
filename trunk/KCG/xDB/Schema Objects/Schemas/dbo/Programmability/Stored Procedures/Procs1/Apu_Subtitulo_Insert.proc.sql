CREATE PROCEDURE dbo.Apu_Subtitulo_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Apu_Titulo_Id varchar(17),
	@Int_Empresa_Id varchar(17),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apu_Subtitulo] ([Id], [Codigo], [Nombre], [Apu_Titulo_Id], [Int_Empresa_Id], [Estado]) VALUES (@Id, @Codigo, @Nombre, @Apu_Titulo_Id, @Int_Empresa_Id, @Estado);
	
SELECT Id, Codigo, Nombre, Apu_Titulo_Id, Int_Empresa_Id, Estado FROM Apu_Subtitulo WHERE (Id = @Id)