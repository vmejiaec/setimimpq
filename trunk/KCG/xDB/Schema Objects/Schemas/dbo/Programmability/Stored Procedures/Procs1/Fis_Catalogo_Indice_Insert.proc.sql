CREATE PROCEDURE dbo.Fis_Catalogo_Indice_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Estado char(3),
	@Descripcion varchar(2000),
	@Fis_Catalogo_Id varchar(17),
	@Apu_Indice_Id varchar(17),
	@Valor numeric(17, 3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Fis_Catalogo_Indice] ([Id], [Codigo], [Estado], [Descripcion], [Fis_Catalogo_Id], [Apu_Indice_Id], [Valor]) VALUES (@Id, @Codigo, @Estado, @Descripcion, @Fis_Catalogo_Id, @Apu_Indice_Id, @Valor);
	
SELECT Id, Codigo, Estado, Descripcion, Fis_Catalogo_Id, Apu_Indice_Id, Valor FROM Fis_Catalogo_Indice WHERE (Id = @Id)