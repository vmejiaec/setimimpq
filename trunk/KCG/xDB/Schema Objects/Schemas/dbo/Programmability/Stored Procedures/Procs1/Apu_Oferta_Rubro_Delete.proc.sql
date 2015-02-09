CREATE PROCEDURE [dbo].[Apu_Oferta_Rubro_Delete]
(
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
DELETE FROM [Apu_Oferta_Rubro] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Apu_Oferta_Id] = @Original_Apu_Oferta_Id) AND ([Apu_Rubro_Id] = @Original_Apu_Rubro_Id) AND ([Cantidad] = @Original_Cantidad) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))