CREATE PROCEDURE [dbo].Com_DocTec_Ins
(
	@Nombre varchar(200)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Com_DocTec] ([Nombre]) VALUES (@Nombre);
	
SELECT Id, Nombre FROM Com_DocTec WHERE (Id = SCOPE_IDENTITY())