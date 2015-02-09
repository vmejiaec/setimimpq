CREATE PROCEDURE dbo.Apu_Oferta_Mano_Obra_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Oferta_Id varchar(17),
	@Apu_Mano_Obra_Id varchar(17),
	@Apu_Categoria_Id varchar(17),
	@Apu_Indice_Id varchar(17),
	@Estado char(3),
	@Costo_Diario numeric(17, 4)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apu_Oferta_Mano_Obra] ([Id], [Codigo], [Apu_Oferta_Id], [Apu_Mano_Obra_Id], [Apu_Categoria_Id], [Apu_Indice_Id], [Estado], [Costo_Diario]) VALUES (@Id, @Codigo, @Apu_Oferta_Id, @Apu_Mano_Obra_Id, @Apu_Categoria_Id, @Apu_Indice_Id, @Estado, @Costo_Diario);
	
SELECT Id, Codigo, Apu_Oferta_Id, Apu_Mano_Obra_Id, Apu_Categoria_Id, Apu_Indice_Id, Estado, Costo_Diario FROM Apu_Oferta_Mano_Obra WHERE (Id = @Id)