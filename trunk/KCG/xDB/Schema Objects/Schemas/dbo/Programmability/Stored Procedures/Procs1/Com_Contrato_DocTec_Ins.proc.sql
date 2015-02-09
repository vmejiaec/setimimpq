CREATE PROCEDURE [dbo].Com_Contrato_DocTec_Ins
(
	@Com_Contrato_Id int,
	@Nombre varchar(200),
	@Tiene char(2)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Com_Contrato_DocTec] ([Com_Contrato_Id], [Nombre], [Tiene]) VALUES (@Com_Contrato_Id, @Nombre, @Tiene);
	
SELECT Id, Com_Contrato_Id, Nombre, Tiene FROM Com_Contrato_DocTec WHERE (Id = SCOPE_IDENTITY())