CREATE PROCEDURE [dbo].Com_DocTec_Del
(
	@Original_Id int,
	@Original_Nombre varchar(200)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Com_DocTec] WHERE (([Id] = @Original_Id) AND ([Nombre] = @Original_Nombre))