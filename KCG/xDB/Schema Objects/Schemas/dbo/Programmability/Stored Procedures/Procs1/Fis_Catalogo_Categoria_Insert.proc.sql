CREATE PROCEDURE dbo.Fis_Catalogo_Categoria_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Fis_Catalogo_Id varchar(17),
	@Apu_Categoria_Id varchar(17),
	@Valor numeric(17, 4),
	@Estado char(3),
	@Descripcion varchar(2000)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Fis_Catalogo_Categoria] ([Id], [Codigo], [Fis_Catalogo_Id], [Apu_Categoria_Id], [Valor], [Estado], [Descripcion]) VALUES (@Id, @Codigo, @Fis_Catalogo_Id, @Apu_Categoria_Id, @Valor, @Estado, @Descripcion);
	
SELECT Id, Codigo, Fis_Catalogo_Id, Apu_Categoria_Id, Valor, Estado, Descripcion FROM Fis_Catalogo_Categoria WHERE (Id = @Id)