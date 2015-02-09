CREATE PROCEDURE [dbo].[Apu_Oferta_Rubro_Insert]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Oferta_Id varchar(17),
	@Apu_Rubro_Id varchar(17),
	@Cantidad numeric(17, 4),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apu_Oferta_Rubro] ([Id], [Codigo], [Apu_Oferta_Id], [Apu_Rubro_Id], [Cantidad], [Estado]) VALUES (@Id, @Codigo, @Apu_Oferta_Id, @Apu_Rubro_Id, @Cantidad, @Estado);
	
SELECT Id, Codigo, Apu_Oferta_Id, Apu_Rubro_Id, Cantidad, Estado FROM Apu_Oferta_Rubro WHERE (Id = @Id)