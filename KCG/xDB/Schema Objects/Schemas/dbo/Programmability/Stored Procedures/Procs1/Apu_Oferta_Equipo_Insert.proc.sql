CREATE PROCEDURE dbo.Apu_Oferta_Equipo_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Oferta_Id varchar(17),
	@Apu_Equipo_Id varchar(17),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apu_Oferta_Equipo] ([Id], [Codigo], [Apu_Oferta_Id], [Apu_Equipo_Id], [Estado]) VALUES (@Id, @Codigo, @Apu_Oferta_Id, @Apu_Equipo_Id, @Estado);
	
SELECT Id, Codigo, Apu_Oferta_Id, Apu_Equipo_Id, Estado FROM Apu_Oferta_Equipo WHERE (Id = @Id)