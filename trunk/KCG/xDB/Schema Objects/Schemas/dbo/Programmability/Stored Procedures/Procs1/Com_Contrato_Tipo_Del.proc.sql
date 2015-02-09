CREATE PROCEDURE [dbo].Com_Contrato_Tipo_Del
(
	@Original_Id int,
	@Original_Nombre varchar(300),
	@IsNull_URL_Plantilla_Word Int,
	@Original_URL_Plantilla_Word varchar(300)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Com_Contrato_Tipo] WHERE (([Id] = @Original_Id) AND ([Nombre] = @Original_Nombre) AND ((@IsNull_URL_Plantilla_Word = 1 AND [URL_Plantilla_Word] IS NULL) OR ([URL_Plantilla_Word] = @Original_URL_Plantilla_Word)))