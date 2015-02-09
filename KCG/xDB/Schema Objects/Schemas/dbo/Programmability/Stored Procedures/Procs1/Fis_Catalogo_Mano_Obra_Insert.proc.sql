CREATE PROCEDURE dbo.Fis_Catalogo_Mano_Obra_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Fis_Catalogo_Id varchar(17),
	@Apu_Categoria_Id varchar(17),
	@Apu_Mano_Obra_Id varchar(17),
	@Valor numeric(17, 2),
	@Estado char(3),
	@Descripcion varchar(2000)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Fis_Catalogo_Mano_Obra] ([Id], [Codigo], [Fis_Catalogo_Id], [Apu_Categoria_Id], [Apu_Mano_Obra_Id], [Valor], [Estado], [Descripcion]) VALUES (@Id, @Codigo, @Fis_Catalogo_Id, @Apu_Categoria_Id, @Apu_Mano_Obra_Id, @Valor, @Estado, @Descripcion);
	
SELECT Id, Codigo, Fis_Catalogo_Id, Apu_Categoria_Id, Apu_Mano_Obra_Id, Valor, Estado, Descripcion FROM Fis_Catalogo_Mano_Obra WHERE (Id = @Id)