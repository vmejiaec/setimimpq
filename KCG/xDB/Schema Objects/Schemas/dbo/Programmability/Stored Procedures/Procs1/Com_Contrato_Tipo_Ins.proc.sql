CREATE PROCEDURE [dbo].Com_Contrato_Tipo_Ins
(
	@Nombre varchar(300),
	@URL_Plantilla_Word varchar(300)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Com_Contrato_Tipo] ([Nombre], [URL_Plantilla_Word]) VALUES (@Nombre, @URL_Plantilla_Word);
	
SELECT Id, Nombre, URL_Plantilla_Word FROM Com_Contrato_Tipo WHERE (Id = SCOPE_IDENTITY())