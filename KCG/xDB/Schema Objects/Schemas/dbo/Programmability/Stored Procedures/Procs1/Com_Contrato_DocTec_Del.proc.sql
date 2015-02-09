CREATE PROCEDURE [dbo].Com_Contrato_DocTec_Del
(
	@Original_Id int,
	@Original_Com_Contrato_Id int,
	@Original_Nombre varchar(200),
	@Original_Tiene char(2)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Com_Contrato_DocTec] WHERE (([Id] = @Original_Id) AND ([Com_Contrato_Id] = @Original_Com_Contrato_Id) AND ([Nombre] = @Original_Nombre) AND ([Tiene] = @Original_Tiene))