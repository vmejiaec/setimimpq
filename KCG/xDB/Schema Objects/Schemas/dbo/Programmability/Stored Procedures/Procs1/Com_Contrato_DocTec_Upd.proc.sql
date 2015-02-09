CREATE PROCEDURE [dbo].Com_Contrato_DocTec_Upd
(
	@Com_Contrato_Id int,
	@Nombre varchar(200),
	@Tiene char(2),
	@Original_Id int,
	@Original_Com_Contrato_Id int,
	@Original_Nombre varchar(200),
	@Original_Tiene char(2),
	@Id int
)
AS
	SET NOCOUNT OFF;
UPDATE [Com_Contrato_DocTec] SET [Com_Contrato_Id] = @Com_Contrato_Id, [Nombre] = @Nombre, [Tiene] = @Tiene WHERE (([Id] = @Original_Id) AND ([Com_Contrato_Id] = @Original_Com_Contrato_Id) AND ([Nombre] = @Original_Nombre) AND ([Tiene] = @Original_Tiene));
	
SELECT Id, Com_Contrato_Id, Nombre, Tiene FROM Com_Contrato_DocTec WHERE (Id = @Id)