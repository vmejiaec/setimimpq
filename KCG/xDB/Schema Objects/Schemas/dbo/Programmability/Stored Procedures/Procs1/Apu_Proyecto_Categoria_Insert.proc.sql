CREATE PROCEDURE [dbo].[Apu_Proyecto_Categoria_Insert]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Proyecto_Id varchar(17),
	@Apu_Categoria_Id varchar(17),
	@Costo_Diario numeric(17,4),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apu_Proyecto_Categoria] ([Id], [Codigo], [Apu_Proyecto_Id], [Apu_Categoria_Id], [Costo_Diario], [Estado]) VALUES (@Id, @Codigo, @Apu_Proyecto_Id, @Apu_Categoria_Id, @Costo_Diario, @Estado);
	
SELECT Id, Codigo, Apu_Proyecto_Id, Apu_Categoria_Id, Costo_Diario, Estado FROM Apu_Proyecto_Categoria WHERE (Id = @Id)
