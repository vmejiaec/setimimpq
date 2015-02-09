CREATE PROCEDURE [dbo].[Apu_Oferta_Rubro_Update]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Apu_Oferta_Id varchar(17),
	@Apu_Rubro_Id varchar(17),
	@Cantidad numeric(17, 4),
	@Estado char(3),
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Apu_Oferta_Id varchar(17),
	@Original_Apu_Rubro_Id varchar(17),
	@Original_Cantidad numeric(17, 4),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
UPDATE [Apu_Oferta_Rubro] SET [Id] = @Id, [Codigo] = @Codigo, [Apu_Oferta_Id] = @Apu_Oferta_Id, [Apu_Rubro_Id] = @Apu_Rubro_Id, [Cantidad] = @Cantidad, [Estado] = @Estado WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Apu_Oferta_Id] = @Original_Apu_Oferta_Id) AND ([Apu_Rubro_Id] = @Original_Apu_Rubro_Id) AND ([Cantidad] = @Original_Cantidad) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)));
	
SELECT Id, Codigo, Apu_Oferta_Id, Apu_Rubro_Id, Cantidad, Estado FROM Apu_Oferta_Rubro WHERE (Id = @Id)