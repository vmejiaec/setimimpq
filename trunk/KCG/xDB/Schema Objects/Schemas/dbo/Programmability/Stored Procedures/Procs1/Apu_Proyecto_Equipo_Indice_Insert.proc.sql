CREATE PROCEDURE dbo.Apu_Proyecto_Equipo_Indice_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Proyecto_Equipo_Id varchar(17),
	@Apu_Indice_Id varchar(17),
	@Porcentaje numeric(5, 2),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apu_Proyecto_Equipo_Indice] ([Id], [Codigo], [Apu_Proyecto_Equipo_Id], [Apu_Indice_Id], [Porcentaje], [Estado]) VALUES (@Id, @Codigo, @Apu_Proyecto_Equipo_Id, @Apu_Indice_Id, @Porcentaje, @Estado);
	
SELECT Id, Codigo, Apu_Proyecto_Equipo_Id, Apu_Indice_Id, Porcentaje, Estado FROM Apu_Proyecto_Equipo_Indice WHERE (Id = @Id)