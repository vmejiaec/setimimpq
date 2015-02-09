CREATE PROCEDURE [dbo].Com_Contrato_Tipo_Upd
(
	@Nombre varchar(300),
	@URL_Plantilla_Word varchar(300),
	@Original_Id int,
	@Original_Nombre varchar(300),
	@IsNull_URL_Plantilla_Word Int,
	@Original_URL_Plantilla_Word varchar(300),
	@Id int
)
AS
	SET NOCOUNT OFF;
UPDATE [Com_Contrato_Tipo] SET [Nombre] = @Nombre, [URL_Plantilla_Word] = @URL_Plantilla_Word WHERE (([Id] = @Original_Id) AND ([Nombre] = @Original_Nombre) AND ((@IsNull_URL_Plantilla_Word = 1 AND [URL_Plantilla_Word] IS NULL) OR ([URL_Plantilla_Word] = @Original_URL_Plantilla_Word)));
	
SELECT Id, Nombre, URL_Plantilla_Word FROM Com_Contrato_Tipo WHERE (Id = @Id)