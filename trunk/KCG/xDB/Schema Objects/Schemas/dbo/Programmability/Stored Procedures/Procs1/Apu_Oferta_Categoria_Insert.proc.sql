CREATE PROCEDURE dbo.Apu_Oferta_Categoria_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Oferta_Id varchar(17),
	@Apu_Categoria_Id varchar(17),
	@Costo_Diario numeric(17, 4),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apu_Oferta_Categoria] ([Id], [Codigo], [Apu_Oferta_Id], [Apu_Categoria_Id], [Costo_Diario], [Estado]) VALUES (@Id, @Codigo, @Apu_Oferta_Id, @Apu_Categoria_Id, @Costo_Diario, @Estado);
	
SELECT Id, Codigo, Apu_Oferta_Id, Apu_Categoria_Id, Costo_Diario, Estado FROM Apu_Oferta_Categoria WHERE (Id = @Id)