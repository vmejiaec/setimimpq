CREATE PROCEDURE dbo.Apu_Oferta_Material_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Oferta_Id varchar(17),
	@Apu_Indice_Id varchar(17),
	@Apu_Material_Id varchar(17),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apu_Oferta_Material] ([Id], [Codigo], [Apu_Oferta_Id], [Apu_Indice_Id], [Apu_Material_Id], [Estado]) VALUES (@Id, @Codigo, @Apu_Oferta_Id, @Apu_Indice_Id, @Apu_Material_Id, @Estado);
	
SELECT Id, Codigo, Apu_Oferta_Id, Apu_Indice_Id, Apu_Material_Id, Estado FROM Apu_Oferta_Material WHERE (Id = @Id)