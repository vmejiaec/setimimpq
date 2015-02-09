CREATE PROCEDURE [dbo].[Apu_Proyecto_Mano_Obra_Insert]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Costo_Diario numeric(17, 4),
	@Apu_Proyecto_Id varchar(17),
	@Apu_Mano_Obra_Id varchar(17),
	@Apu_Indice_Id varchar(17),
	@Apu_Categoria_Id varchar(17),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;

if not( @Apu_Categoria_Id is null)

   set @Costo_Diario = dbo._Apu_Proyecto_Categoria_Costo_Diario ( dbo._Apu_Proyecto_Categoria_Id(@Apu_Proyecto_Id,@Apu_Categoria_Id))


INSERT INTO [Apu_Proyecto_Mano_Obra] 
([Id], [Codigo], [Costo_Diario], 
[Apu_Proyecto_Id], [Apu_Mano_Obra_Id], 
[Apu_Indice_Id], [Apu_Categoria_Id], [Estado]) 
VALUES (@Id, @Codigo, @Costo_Diario, @Apu_Proyecto_Id, @Apu_Mano_Obra_Id, @Apu_Indice_Id, @Apu_Categoria_Id, @Estado);
	
SELECT Id, Codigo, Costo_Diario, Apu_Proyecto_Id, Apu_Mano_Obra_Id, Apu_Indice_Id, Apu_Categoria_Id, Estado FROM Apu_Proyecto_Mano_Obra WHERE (Id = @Id)




